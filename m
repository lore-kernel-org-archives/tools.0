Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B467B
	for <tools@linux.kernel.org>; Mon,  6 Feb 2023 18:23:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so9564366wms.1
        for <tools@linux.kernel.org>; Mon, 06 Feb 2023 10:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tp3JkuzllV1vHXdEh6qGoyrtJpxd5cbLTZGLXI29o/w=;
        b=xF5B0Tlj8vMhn6VxQFY3B8qJe+60pOQx8B1RxSzPEGkn84cnLoyGrUyhlA5AyV7qRp
         a8w/l1aL47JRiP128i0EyE6wnYqn+B1bp2v93j0sj70nGofNJ1UmB1PveqB7ZiGEWKcX
         BnAl0LijwjfYYAbB6VJXVodHdWvfz6kCsa1stVqHriMzfOBqiHjQBjnOHqDlMERhJv3T
         17BC7cUSVH2wVrO3YetDVoEbOXf25TSsJcF6zP+hjKRDXJW7fwDzzbgGp8yLD9Y5F+G1
         buHPnBZGmDL7wMw4Z6Rree3ueopfg8sV4MCYAgnmra7skkMP+hAYpAFsivo9eE5qKV5X
         PK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tp3JkuzllV1vHXdEh6qGoyrtJpxd5cbLTZGLXI29o/w=;
        b=jvYx0gMJHPHeFX8dGA86KDTua06DsbWNuGTPlPvX7DfZiIFDtXGItovdSSMTt+GIiw
         JOyrsalz58GzVripLoymmwfGA70Fgios+h1vqn+yzeR32qKmmW094FeUA/iTGLFcxmXl
         cFkQpzczAwR6fXu3QZbaWmibM7xP26GreObzpphoI31n4oQXtbemBxFc14ZR9hzvIfwy
         k4+YOHF3m1+ojaXazP5N6YaLCsjGRCqfqubhay610W9KcFCFHLq6yQTXxnpu0sNrEMNd
         g5imjEnEqQGfG3Ek4Te1erymaLoaS1qgj8hPvANnpkPua8Pzi04hnCwuY0sYfY+xfQiR
         IRqQ==
X-Gm-Message-State: AO0yUKUEHzozevEVYrsEsUPPu3otgNh+r1KUINdRfmuDlHvwvohRoS3p
	L8AzWM+lUpnRIuXhjbAW1pq730tfrJs9uIwYnBc=
X-Google-Smtp-Source: AK7set/5tx8M2b8COr/PhZpLnzPuJQNK4nDiOPAhM+mmiSY84nL7B+4RGQYxI1br0iDLInXwq838EA==
X-Received: by 2002:a05:600c:13ca:b0:3dc:5937:35a2 with SMTP id e10-20020a05600c13ca00b003dc593735a2mr647643wmg.9.1675707811474;
        Mon, 06 Feb 2023 10:23:31 -0800 (PST)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm12871588wmc.4.2023.02.06.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 10:23:31 -0800 (PST)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: [PATCH b4 RFC 0/3] "b4 prep --new --fork-point" is not clear to me
Date: Mon, 06 Feb 2023 19:23:01 +0100
Message-Id: <20230206-b4-prep-fork-point-as-base-branch-v1-0-2732e0c32f5d@tessares.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVF4WMC/02NQQrCMBBFr1Jm7UBMSytuBQ/QrbjINFM7iEmYF
 BFK727iyuX7D97fILMKZzg3Gyi/JUsMBY6HBqbFhQej+MJgjW2NNT1Sh0k54Rz1iSlKWNFlJJc
 ZSV2YFmyHgciS9b4/Qen8uVp6ubyyVlE6s3x+5zegrk7j9QL3ff8CKWKlhJcAAAA=
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=hNanyjXh4kJ+t6uD2jM435umdERDF13mvWlkyRi2OYk=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBj4UWi0rYg2LtXxowIGS81Ugrg778bnKTvXPlWI
 N8C0jAsijmJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCY+FFogAKCRD2t4JPQmmg
 c00fD/9mUzKReBo2ej6htRv+UegjmAPYiZONG2KV/A8wdBRvGdhiHgO28ZUcJtGM4fOvpFjq1f1
 ZWHeMTO8wSsF07Su712imY2tdT4tMFxjUi0E5MjLJ9y0gZdF3rxKrR/Wx4viNpznMttnc1w8Ouu
 5KiUsXea5N7D4Udm4rGTVd+O/HbdGxxwdo5hZ7PzG/mQvPagPHXtPf0zkPNr/MDav/bctpDKX+s
 sxE3cefYn0KXQ5p6pF3GLAekSqI5sJDEkDdlJggA5zyX/XBEgGNeca1GvxpFzzxVq14+hVNori6
 FuahQeDY//I2TNsxg4dWtZ0ZdvkjD3PELSsCzLTN3BES4JfukyFDwuCFloxnMk8IxrPd12Z8hZf
 mDpBIneiatkzaCtrs+bglGA3jfuJKiPf55H8GU8KaB05KX2M/8dq5krQMENfSNAU1Kyh1zZTzH9
 8ThnwzdAM6XgC5kcQSShZcdnozHQX3EGhlF2laLZM7/SqI4pjSYONoeSJ578nRkuDvbySYaRdaq
 rSHvQth1J5Nvu4bh94jFST2iDVqjxYdYO/NkqpVxUsF00rBQzUv+xNcXKoUapynUkKYKfjqt/dJ
 J95ba8D1JmbedM/xReln+36g8ntF0aRRC/bQR5mqwFLSG5JxV2vrN+R+ZKZMhcEQwnJMITN0N7G
 23Y3FJw9ZRq1foQ==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

This is an RFC because when looking at the code, I'm not sure I'm using
this command properly.

For me, using '--fork-point' is useful to avoid switching to another
branch before calling 'b4 prep -n', no? On my side, it is especially
useful if this other branch is not a local one, e.g.

  b4 prep -n foo -f linus/master

It seems doing what I want by creating the new b4 branch on top of
'linus/master' one. Except that b4 was using the current branch as 'base
branch'.

I thought it was a bug and I just changed the line that was problematic
for me (patch 1).

But when I looked at the code just above, I didn't find a reason why
the current branch is also used there with the other strategies. I'm
sure I'm missing something there but just in case, I did this
modification (patch 2). Maybe all we need is to make sure the given
argument is a branch (patch 3)?

Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
Matthieu Baerts (3):
      ez: prep -n: use fork-point as base branch
      ez: prep -n: always use fork-point as a base
      ez: prep -n: validate fork-point is a branch

 b4/ez.py | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)
---
base-commit: ada3021c64dd484e53219eb3af55da6c8f25d0ec
change-id: 20230206-b4-prep-fork-point-as-base-branch-377bb2b2dd68

Best regards,
-- 
Matthieu Baerts <matthieu.baerts@tessares.net>

