import Vapor

extension Application.Redis {
    @available(*, deprecated, message: "use `app.redises.use(_: RedisConfiguration, as: RedisID)`")
    public var configuration: RedisConfiguration? {
        get {
            self.application.redises.configuration(for: self.redisID)
        }
        nonmutating set {
            guard let newConfig = newValue else {
                return
            }
            self.application.redises.use(newConfig, as: self.redisID)
        }
    }
}
