import UIKit

class MeditationView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        backgroundColor = UIColor(rgb: 0xF9FAFB)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.contentInset = UIEdgeInsets(top: 0,
                                              left: 0,
                                              bottom: bottomGradientView.frame.size.height * 0.9,
                                              right: 0)
    }

    let navigationView = NavigationView()
    let tableView = SubviewFactory.tableView()
    let bottomGradientView = SubviewFactory.bottomGradientView()

    // MARK: - Privates

    private func addSubviews() {
        addSubview(navigationView)
        addSubview(tableView)
        addSubview(bottomGradientView)
    }

    private func setupLayout() {
        navigationView.pinTop(to: safeAreaLayoutGuide.topAnchor)
        navigationView.pinLeading(to: leadingAnchor)
        navigationView.pinTrailing(to: trailingAnchor)
        tableView.pinTop(to: navigationView.bottomAnchor, offset: 16)
        tableView.pinLeading(to: leadingAnchor, offset: 16)
        tableView.pinTrailing(to: trailingAnchor)
        tableView.pinBottom(to: bottomAnchor)
        bottomGradientView.pinLeading(to: leadingAnchor)
        bottomGradientView.pinTrailing(to: trailingAnchor)
        bottomGradientView.pinHeight(to: heightAnchor, multiplier: 0.25)
        bottomGradientView.pinBottom(to: bottomAnchor, offset: 10)
    }

}

private extension MeditationView {

    struct SubviewFactory {

        static func tableView() -> UITableView {
            let tableView = UITableView(frame: .zero)
            tableView.backgroundColor = UIColor(rgb: 0xF9FAFB)
            return tableView
        }

        static func bottomGradientView() -> GradientView {
            let gradientStyle = GradientStyle(colors: [GradientColor(location: 0.0,
                                                                     color: UIColor(white: 1,
                                                                                    alpha: 0)),
                                                       GradientColor(location: 0.3,
                                                                     color: .white),
                                                       GradientColor(location: 1.0,
                                                                     color: UIColor(rgb: 0xF3F5F6))],
                                              direction: .vertical)
            let gradientView = GradientView(style: gradientStyle)
            gradientView.isUserInteractionEnabled = false
            return gradientView
        }

    }

}
