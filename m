Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3323366
	for <tools@linux.kernel.org>; Thu, 12 Jan 2023 04:51:44 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id t10so7352964vsr.3
        for <tools@linux.kernel.org>; Wed, 11 Jan 2023 20:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pefoley.com; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QGQgHvV4WNKFMQCUarWQQ3S2s5aKyhSUXtDoB18lV0g=;
        b=IO3PGNxDgj+Q8KOCDOkkGrLBNidfPfkYGZ5PZU90pQY95cH1u44pKiTZtVsyIUNlkN
         WO+0B28T4EiMy3R3H3tCb28/ZkgiH0011yQFbREhnhM37bjln4ms3lsCgieisaet17GD
         KVrhzsk9OtAxeKJ2fH7ky99/dqkGh03sI7YEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGQgHvV4WNKFMQCUarWQQ3S2s5aKyhSUXtDoB18lV0g=;
        b=0Rv9jCSY+zf++1FY6vv/ZkJmW9jPJxgQ8ha4quU979qluWHZJ0ezRo+7aaixuze7u5
         SmXKvT0HpZ8uDhAi20/hgsvC8s67TRN628J65mSs6T/AI+5CsRVrvmtvfNXzOVq9PM4o
         napTz4vtMxYYy7OFEWz8U9I6OthNJNLFg1DSX0afLSo/LU/v4X5rnCoiWH7vwJjcKdAZ
         Y94zWiMYvUG4Wzwu/RkbkMNuQBG7U74G1H56yqvkLcLnFf8rMHmhE+HvaGpkg5JBrMDK
         eFCVQK0mMOJPTWUfKtTUhl30u538MB+1QAcR3nombnPHYsCYLXC+Dji6xEcYRcOw9aTz
         qeBw==
X-Gm-Message-State: AFqh2kqDk4pWBmJeLehl0QMyKWKjuDoMEvgDesYlsX8rdtt+P8Gx44sE
	/RTYDMFZidkK66t3pYfk/ZOyy2TwMWc4+EKpoloE0Gn1VdIZeNGdT4A=
X-Google-Smtp-Source: AMrXdXvvf/8708qJLSJao4U4gzjf+LifZS+ouRVwhqs4HUHYzXw8uADhMmjCYaU/c/0mhKPDg4odbUE7yC4V86jTQl8=
X-Received: by 2002:a67:b205:0:b0:3b0:eec8:ce04 with SMTP id
 b5-20020a67b205000000b003b0eec8ce04mr12778200vsf.16.1673499103028; Wed, 11
 Jan 2023 20:51:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Peter Foley <pefoley2@pefoley.com>
Date: Wed, 11 Jan 2023 20:51:32 -0800
Message-ID: <CAOFdcFNhD0EKnRwjCG+duttF+zxeEjv7qx31abSyg03csn6B5w@mail.gmail.com>
Subject: Better error message when trying to use auto-to-cc on an empty branch
To: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I was poking around at
https://people.kernel.org/monsieuricon/sending-a-kernel-patch-with-b4-part-1
and ran into a corner case.

I had an existing commit that I wanted to try out b4 with, so I ran
"b4 prep -n kconfig" on top of the commit.
I then immediately ran b4 prep -c and got this:
b4 prep -c
Will collect To: addresses using get_maintainer.pl
Will collect Cc: addresses using get_maintainer.pl
Traceback (most recent call last):
  File "/home/peter/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
  File "/home/peter/.local/lib/python3.10/site-packages/b4/command.py",
line 359, in cmd
    cmdargs.func(cmdargs)
  File "/home/peter/.local/lib/python3.10/site-packages/b4/command.py",
line 76, in cmd_prep
    b4.ez.cmd_prep(cmdargs)
  File "/home/peter/.local/lib/python3.10/site-packages/b4/ez.py",
line 1902, in cmd_prep
    return auto_to_cc()
  File "/home/peter/.local/lib/python3.10/site-packages/b4/ez.py",
line 1824, in auto_to_cc
    tos, ccs, tag_msg, patches = get_prep_branch_as_patches()
  File "/home/peter/.local/lib/python3.10/site-packages/b4/ez.py",
line 1143, in get_prep_branch_as_patches
    patches = b4.git_range_to_patches(None, start_commit, 'HEAD',
  File "/home/peter/.local/lib/python3.10/site-packages/b4/__init__.py",
line 2766, in git_range_to_patches
    raise RuntimeError(f'Could not run rev-list {start}..{end}')
RuntimeError: Could not run rev-list
17d982ccd4b5d7b274578eec3ca5d903de594d77..HEAD

I eventually figured out that the problem was the commit order (the
cover letter should have been the ancestor of my commit), so I was
able to just git rebase -i and swap the two commits. At that point
things worked fine, but it would be nice if the error message was a
little more obvious.

Reporting here per the request on
https://b4.docs.kernel.org/en/latest/index.html

Thanks,

Peter Foley
