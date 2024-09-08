locals {
  env_settings = {
    team1 = {
      prod = {
        emails = {
          channel1 = "thist1@that.nl"
          channel2 = "channelthist2@that.nl"
        }
      }
      dev = {
        emails = {
          channel1 = "thist1@that.nl"
          channel2 = "channelthist2@that.nl"
        }
      }
    }
    team2 = {
      prod = {
        emails = {
          channel1 = "thist2@that.nl"
          channel2 = "channelthist2@that.nl"
        }
      }
      dev = {
        emails = {
          channel1 = "thist2@that.nl"
          channel2 = "channelthist2@that.nl"
        }
      }
    }

  }
}

output "z_test5_prod_team_emails" {
  value = flatten([
    for team, environments in local.env_settings : [
      for environment, settings in environments : [
        for _, emails in settings : [
          for _, email in emails : environment == "prod" ? email : null
        ]
      ]
    ]
  ])
}
