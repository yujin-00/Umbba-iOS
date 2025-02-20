//
//  SettingViewController.swift
//  Umbba-iOS
//
//  Created by 남유진 on 2023/07/07.
//

import UIKit

import SnapKit
import SafariServices

final class SettingViewController: UIViewController {
    
    // MARK: - UI Components
        
    private let settingTableView = SettingTableView()
    private lazy var settingtableView = settingTableView.tableView
    private let userSection = I18N.Setting.userSectionLabel
    private let teamSection = I18N.Setting.teamSectionLabel
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        view = settingTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegate()
        setNotification()
    }
}

// MARK: - Extensions

private extension SettingViewController {

    func setDelegate() {
        settingtableView.delegate = self
        settingtableView.dataSource = self
    }
    
    func setNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(getAlert),
                                               name: NSNotification.Name("Alert"),
                                               object: nil)
    }
    
    @objc
    private func getAlert(_ notification: NSNotification) {
        DispatchQueue.main.async {
            self.settingtableView.reloadData()
        }
    }
}

extension SettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let header = SettingSectionHeaderView.dequeueReusableHeaderFooterView(tableView: tableView)
            header.alarmdelegate = self
            header.alarmSwitch.isOn = UserManager.shared.getAllowAlarm

            return header
        } else {
            return UIView()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 72
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let accountViewController = AccountViewController()
            self.navigationController?.pushViewController(accountViewController, animated: true)
        case 1:
            if let url = URL(string: I18N.Setting.urlArray[indexPath.row]) {
                let safariViewController = SFSafariViewController(url: url)
                present(safariViewController, animated: true, completion: nil)
            }
        default:
            return
        }
    }
}

extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return userSection.count
        case 1:
            return teamSection.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingTableViewCell.dequeueReusableCell(tableView: tableView, indexPath: indexPath)
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.contentLabel.text = I18N.Setting.userSectionLabel[indexPath.row]
        case 1:
            cell.contentLabel.text = I18N.Setting.teamSectionLabel[indexPath.row]
        default:
            return UITableViewCell()
        }
        return cell
    }
}

extension SettingViewController: AlarmSwitchDelegate {
    func alarmSwitchTapped() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
}
