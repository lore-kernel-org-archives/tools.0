Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.5763.1605194497627348300
 for <tools@linux.kernel.org>;
 Thu, 12 Nov 2020 07:21:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KdsPtfZE;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id 7so4211105qtp.1
        for <tools@linux.kernel.org>; Thu, 12 Nov 2020 07:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eD7xgNUHt5OsiJoGSxIyMxy+61z9V8aiw8a8J4oCd6U=;
        b=KdsPtfZEcbmQ6/Pl2w/2j2iBgC2wn7RLIKb6PLxiRvMi9FEk2K2LOyqrft/n6k+h11
         3dwn/2YEKL3jgmDgaWjjO7oPUD2moyD2h8KE6dhpoPJzwDEhr1tfnrtXm7pQRusrM5AK
         KlMAyt1BkI7/5zXUsDwVu7l7LG9+MVSx2cmNMiTqy7tXFZ5maTxry9thsMUG/iB63S3Y
         ifr311rPK6n9PtZc4LKITU7KwGYYvZx171XG6+c5mlABAFzUeswbKiZ03tEF+2/Tkey0
         TYVHEjUwOKUCpODLMry2+5NQrZuVPoHEw3tLDF2dEDZ8BMI1urxM/jqJByLdeTUlp03n
         qzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eD7xgNUHt5OsiJoGSxIyMxy+61z9V8aiw8a8J4oCd6U=;
        b=A4U0ke6xPLvqffdw2zCmI7AOSCHvxWCxrnQoYscYvCVdrO2dC9IeS3xRHOxr/igggF
         AZb/fD4atBL7QGO6EcVtetaeN7ufo3dD9enpOzxk80exKx5khfoS4GPvpbzOpVJiznhC
         UgH/tRnstg9u67zFImBn4DUQtZpf5x0U5gs49Y6a3jR0PHTXArmwsgo9d07GMlzQejjZ
         5va3prNPVfMNaUh5ci2RIbNauts/0wmKdteRUmigiAY/WdU/6sUT7sVWLVfNXpQ6evkL
         6eoz8suftG7lpjysgw+HBLfniQx0K6u2VIZAGR1rINiT7vsgAeG3kO5qKMhB0fP87VFm
         RMBQ==
X-Gm-Message-State: AOAM533p9Ja1ISofzhqwajUv4bSsXq14f42BjAER8gMXAnEBN+o9cUzK
	vKmWa7vShNXqAOdLWHp42lQ1K/h96CSZZw==
X-Google-Smtp-Source: ABdhPJzfuWvNfkxtlQSESOOY39ZFASEuZBB6odQNg4TKzKkUfqzB14owOJyHcqcx5dYwZKuo7aiDdQ==
X-Received: by 2002:ac8:58c8:: with SMTP id u8mr20499737qta.25.1605194496520;
        Thu, 12 Nov 2020 07:21:36 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from localhost.localdomain ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id k70sm5230351qke.46.2020.11.12.07.21.35
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Nov 2020 07:21:35 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org
Subject: [PATCH b4 0/4] Add the man page to the pip package
Date: Thu, 12 Nov 2020 10:21:30 -0500
Message-Id: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ! I'm a Git contributor and just discovered b4 yesterday.
I'm already convinced it will be a great addition to my workflow.

I noticed that the man page is not installed when you 'pip install' the
package, so patch 4/4 in this here series takes care of that.

The other 3 patches are project-level goodies that I thought were good
additions. Feel free to drop them if you don't think so.

Cheers!

Philippe.

P.S. a quick search on https://lore.kernel.org/git/ reveals you did not
formally announce neither b4 nor its predecessor get-lore-mbox there. I think
it could be helpful for some Git folks too :)

Philippe Blain (4):
  Add '.venv' to .gitignore
  Link to the README from PyPI
  Add pointers to https://linux.kernel.org/g/tools
  Distribute the manpage with the pip package

 .gitignore   | 1 +
 README.rst   | 3 ++-
 man/b4.5     | 3 ++-
 man/b4.5.rst | 3 ++-
 setup.py     | 6 +++++-
 5 files changed, 12 insertions(+), 4 deletions(-)


base-commit: f33033c03cf96ed769289ebf6d3c26b0cf540683
-- 
2.27.0

