import { Controller } from "stimulus";

/*
 * When tab is clicked, pane's content is replaced with the tab's content
*/
export default class extends Controller {
  static targets = ['pane', 'tab', 'content']

  HIDDEN = 'wds-tab__tab-content--hidden'
  SELECTED = 'wds-tab__tab--selected'

  ID = 'data-id'

  onClick(e) {
    const id = e.currentTarget.getAttribute(this.ID)
    let selectedTab
    this.tabTargets.forEach((tab) => {
      if (tab.getAttribute(this.ID) === id) {
        selectedTab = tab
      }
    })
    this.selectTab(selectedTab)
  }

  selectTab(selectedTab) {
    this.tabTargets.forEach((tab) => {
      if (selectedTab == tab) {
        tab.classList.add(this.SELECTED)
      } else {
        tab.classList.remove(this.SELECTED)
      }
    })
    const contentId = selectedTab.getAttribute(this.ID)
    this.showContent(contentId)
  }

  showContent(contentId) {
    this.contentTargets.forEach((content) => {
      if (contentId === content.getAttribute(this.ID)) {
        content.classList.remove(this.HIDDEN)
      } else {
        content.classList.add(this.HIDDEN)
      }
    })
  }

  isSelected(tab) {
    return tab.classList.contains(this.SELECTED)
  }

  connect() {
    // Move all tab contents to be in the pane, but hidden initially
    this.contentTargets.forEach((content) => {
      // NOTE: This adds an extra div between the pane and the actual content, compared to React WDS
      this.paneTarget.appendChild(content)
    })

    // Show initially selected content
    this.tabTargets.forEach((tab) => {
      if (this.isSelected(tab)) {
        this.selectTab(tab)
      }
    })
  }
}
