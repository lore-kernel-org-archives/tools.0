Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441FC7E9
	for <tools@linux.kernel.org>; Mon, 20 Feb 2023 00:45:46 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id ay26so962054qtb.1
        for <tools@linux.kernel.org>; Sun, 19 Feb 2023 16:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64Aizq3zUMvwNvd+DfUg0hcy3xTrkYH024HpnZjtoxc=;
        b=JLH9ztvnAU3EvJGL6Uw1p6B3HbAdlu9x19pXyPf/Q4YfuFdY5H+UujKefeZ4wX5Cij
         XIezHCSds+NzTbViqY54S0QwoCPh7DyrhFEWh+q9Ox4yZl324BXQhCvMlF7fQaSm1jYN
         BvPePT6E1nTp+FmwRhglfKPLdqN73rUh0Cue2Hxo71jvXPVRq9o2tZpq5UeLubMNLQ0Y
         j/ERuaWdyhGqg5Sy3OShRggGz9kugrK0HImYPQ0PJg0BrVO28SR3+XzzbdghWWtHpf/D
         +CiLHZOGBn+ycndaa9/iIDFP7ySKPf6DWIUmG9Vd17YVxGdJEBmSQZ8hecjMefSCziZb
         W84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64Aizq3zUMvwNvd+DfUg0hcy3xTrkYH024HpnZjtoxc=;
        b=1qdV/j+D/7eA6eJFOX4XNAQIVwZZeVrLrpt7CV4vIKnd7UhAUgZJMnrtiRqQ0lT4sZ
         KGVeeeqHy8IMOj/zZS/isHuUUHg8Q20jNITCagMC+ajRIuWtvP1yAa7Wq9ChoviqHKrT
         I4DajM2kx8t64XPbvvRq05Lh/yLKtyHwNnfUStAeUsg0xwDtYjsJ14LQbsOw5BnDPASv
         TkjO0BPOj1pJ4lGQiFZfZdu9IenGsYOIaOSg+22kx1UnVr7Q/mg0fgzdfO69RR0uphjq
         AFvamtV7EhmL4SoH5EZTf47HSxA1qbGcvDq95EqhyT4A6OUon835zrit4m2Q/5lmTyfp
         wBTg==
X-Gm-Message-State: AO0yUKWPs/frT8mkYzSzrZwc5kk/9zrB2DVTm7QeE6K3AXMmzc1oXx27
	BQelaxwh+iP2VH7JRIv3O1I=
X-Google-Smtp-Source: AK7set8epdZ2E6Gcj8JNoZWJQL3M2rfRcx4nHHOicQePmvFrI/txk7UiW/JMhmb3XZPkzHEOJ0DsWA==
X-Received: by 2002:a05:622a:12:b0:3b9:2b0:5e7f with SMTP id x18-20020a05622a001200b003b902b05e7fmr15086769qtw.32.1676853945143;
        Sun, 19 Feb 2023 16:45:45 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (bras-base-esmnpq8902w-grc-06-206-172-203-52.dsl.bell.ca. [206.172.203.52])
        by smtp.gmail.com with ESMTPSA id o13-20020ac8698d000000b003ba19e53e43sm7898318qtq.25.2023.02.19.16.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 16:45:44 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Sun, 19 Feb 2023 19:45:42 -0500
Subject: [PATCH] ez: allow remote-tracking branches as 'base-branch'
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230219-allow-remote-branches-as-base-v1-1-a1cf7948b2cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIALXC8mMC/yWMwQrCMBAFf6Xs2cWkCqJ/s0mfNtAkshvrofTfj
 XqcYZiNDJpgdBs2UqzJUi0d/GGgOEt5gNPUmUY3ntzoryzLUt+syLWBg0qJM4zFOIiBfYwTwuX
 s7y5Sf/zkv/peXk9rCsnHLNagtO8fzG1hjIEAAAA=
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.12.1

Since 83b185a (ez: support enrolling branches using tags, 2022-08-16),
we use 'git show-ref --heads' to check if the argument given to
'--enroll-base' is a branch, so that the alternate code path can be
taken for tags. This means that since that commit, using a
remote-tracking branch as argument to '--enroll-base' does not work
well, because such branches are not shown by 'git show-ref --heads'. The
code path for tags is taken instead, and this usually leads to a
"Multiple branches contain object" error (since several local branches
are often based on the same remote-tracking branch).

Pass a fully-qualified ref 'refs/heads/<enroll_base>' as pattern to 'git
show-ref', and also pass it a second second pattern
'refs/remotes/<enroll_base>' to allow both local and remote-tracking
branches.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 b4/ez.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/ez.py b/b4/ez.py
index 74afddc..9cafe0c 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -370,7 +370,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         slug = re.sub(r'\W+', '-', branchname).strip('-').lower()
         enroll_base = cmdargs.enroll_base
         # Is it a branch?
-        gitargs = ['show-ref', '--heads', enroll_base]
+        gitargs = ['show-ref', f'refs/heads/{enroll_base}', f'refs/remotes/{enroll_base}']
         lines = b4.git_get_command_lines(None, gitargs)
         if lines:
             try:

---
base-commit: a3281834d6d5dec44f58071fca2d22e04a97fe18
change-id: 20230219-allow-remote-branches-as-base-1ccdeb741f0c
--
b4 

