import SwiftUI
import Combine

struct RemoteImage<Placeholder: View>: View {
    var url: URL?
    var placeholder: Placeholder?
    @StateObject var loader: ImageLoader
    private let image: (UIImage) -> Image

    init(urlString: String?,
         @ViewBuilder placeholder: () -> Placeholder,
         @ViewBuilder image: @escaping (UIImage) -> Image = { Image(uiImage: $0).resizable() }
    ) {
        let url = urlString.flatMap(URL.init)
        self.url = url
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
        self.placeholder = placeholder()
        self.image = image
    }

    init(urlString: String?,
         @ViewBuilder placeholder: () -> Placeholder,
         isResizable: Bool
    ) {
        if isResizable {
            self.init(urlString: urlString, placeholder: placeholder) { image in
                Image(uiImage: image).resizable()
            }
        } else {
            self.init(urlString: urlString, placeholder: placeholder) { image in
                Image(uiImage: image)
            }
        }
    }

    var body: some View {
        Group {
            if let image = loader.state.image {
                self.image(image)
            } else {
                if let placeholder = placeholder {
                    placeholder
                } else {
                    Rectangle()
                        .fill(Color.gray)
                }
            }
        }
        .onAppear {
            loader.load()
        }
    }
}

extension RemoteImage where Placeholder == Never {
    init(urlString: String?,
         @ViewBuilder image: @escaping (UIImage) -> Image = { Image(uiImage: $0).resizable() }
    ) {
        let url = urlString.flatMap(URL.init)
        self.url = url
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
        self.placeholder = nil
        self.image = image
    }

    init(
        urlString: String?,
        isResizable: Bool
    ) {
        if isResizable {
            self.init(urlString: urlString) { image in
                Image(uiImage: image).resizable()
            }
        } else {
            self.init(urlString: urlString) { image in
                Image(uiImage: image)
            }
        }
    }
}

final class ImageLoader: ObservableObject {
    enum State {
        case initial
        case loading
        case loaded(UIImage?)
        var image: UIImage? {
            if case let .loaded(image) = self {
                return image
            } else {
                return nil
            }
        }
        var isLoading: Bool {
            if case .loading = self {
                return true
            } else {
                return false
            }
        }
        var isInitial: Bool {
            if case .initial = self {
                return true
            } else {
                return false
            }
        }
    }
    private static let cache = NSCache<NSString, UIImage>()
    static func cachedImage(for url: URL?) -> UIImage? {
        url.flatMap { cache.object(forKey: NSString(string: $0.absoluteString)) }
    }
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")

    @Published var state: State = .initial
    var url: URL? {
        didSet {
            if url != oldValue {
                cancellable?.cancel()
                state = .initial
            }
        }
    }
    private var cancellable: AnyCancellable?

    init(url: URL?) {
        self.url = url
        if ProcessInfo.processInfo.isRunningForPreview {
            if let image = Self.dummyImage(url) {
                state = .loaded(image)
            }
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load(completion: ((UIImage?, URL) -> Void)? = nil) {
        guard let url = url else {
            return
        }
        if ProcessInfo.processInfo.isRunningForPreview {
            return
        }
        if state.isLoading {
            return
        }
        let cacheKey = NSString(string: url.absoluteString)
        if let image = Self.cache.object(forKey: cacheKey) {
            state = .loaded(image)
            return
        }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .subscribe(on: Self.imageProcessingQueue)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                if let image = image {
                    Self.cache.setObject(image, forKey: cacheKey)
                } else {
                    Self.cache.removeObject(forKey: cacheKey)
                }
                if self?.url == url {
                    self?.state = .loaded(image)
                    completion?(image, url)
                }
            }
    }
    
    static func dummyImage(_ url: URL?) -> UIImage? {
        guard let path = url?.path else {
            return nil
        }
        let key = path.replacingOccurrences(of: "/", with: "_")
        return UIImage(named: key)
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(urlString: nil)
    }
}
