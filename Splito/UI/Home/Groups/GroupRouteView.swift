//
//  GroupRouteView.swift
//  Splito
//
//  Created by Amisha Italiya on 27/02/24.
//

import Data
import SwiftUI
import BaseStyle

struct GroupRouteView: View {

    @StateObject var appRoute = Router(root: AppRoute.GroupListView)

    var body: some View {
        RouterView(router: appRoute) { route in
            switch route {
            case .GroupListView:
                GroupListView(viewModel: GroupListViewModel(router: appRoute))
            case .GroupHomeView(let id):
                GroupHomeView(viewModel: GroupHomeViewModel(router: appRoute, groupId: id))
            case .CreateGroupView(let group):
                CreateGroupView(viewModel: CreateGroupViewModel(router: appRoute, group: group))
            case .InviteMemberView(let id):
                InviteMemberView(viewModel: InviteMemberViewModel(router: appRoute, groupId: id))
            case .JoinMemberView:
                JoinMemberView(viewModel: JoinMemberViewModel(router: appRoute))
            case .GroupSettingView(let id):
                GroupSettingView(viewModel: GroupSettingViewModel(router: appRoute, groupId: id))
            default:
                EmptyRouteView(routeName: self)
            }
        }
    }
}
