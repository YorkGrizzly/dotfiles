// Put this in under $HOME.
// https://github.com/johnste/finicky

module.exports = {
  defaultBrowser: "Google Chrome",
  options: {
    hideIcon: false,
    checkForUpdate: true,
  },
  handlers: [
    {
      match: ({ opener }) =>
        ["Slack", "Microsoft Outlook"].includes(opener.name),
      browser: {
        name: "Google Chrome",
        profile: "Default",
      },
    },
    {
      match: ({ url }) => url.protocol === "slack",
      browser: "/Applications/Slack.app",
    },
  ],
};
