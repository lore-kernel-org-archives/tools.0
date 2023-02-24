Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB3C15A5
	for <tools@linux.kernel.org>; Fri, 24 Feb 2023 01:14:39 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d7so13198052qtr.12
        for <tools@linux.kernel.org>; Thu, 23 Feb 2023 17:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:in-reply-to:message-id:content-transfer-encoding:mime-version
         :subject:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/ZjUEfLg/X8Poux/I7l2DOSL6tifCPVR1kbrqz3zzE=;
        b=fMFgtn9Fqu/MO9zxvdi8PGGaKKu8lEc8CYAQ7UDetWlz/gBdzZ3cEX6EBRbakL/jvx
         S/xIQ6JOszwGBKGeeBTIx3ZAVF1nYKSWgoQEw8Cn2tGTPKgX9fRWPG/f11A76Q7qYZit
         kRgy0jkfH1BgLjsN3mPg4lZKhXxgqHtIrc7iRPlBdW9WK9x9jhFIYkSXutJzCZbdXXs9
         UopZ103YgXNZFHKkK07MBiPupYDKbulUx61P8ArPWQZtVLEQJWt2sQijEP02muA3aAoV
         gGKkh1qZ69Vr2E8Fqvsk/ZlR1wx++a2KNjr7BQ84h4ih9QZJCCp8rEl5XclIAfwtoLQD
         gj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:message-id:content-transfer-encoding:mime-version
         :subject:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/ZjUEfLg/X8Poux/I7l2DOSL6tifCPVR1kbrqz3zzE=;
        b=qERvoLNkvSDPvpYjlTawTuRGOXCPpmEjhQMCchz0F0cprGRg5LjX903PC69axbZos4
         afWowE8SW2lSknGBJzK8rHC0DPKl3jlWqo3MsGKoHqQ3ZYYQoWTTYiJaOY/gMplyk8OO
         dRweVzEpyglQgCD+7IeBU7zn5oVxIdh2Is195qMXyGcRCWAN5ztJvWLkvafXYeqXOZny
         oexK/KVWE3en3ffyBg7A/qtIzCyURYbzdmPNLqOc8DMHnrlaa6+PvtWfd11Q0iA0D1GI
         szuQxN5x6tkR6Dgf8NZLXyy+8zcEm537FxyG6W6nUesZQ5jKbXA89hmp317ZGwuklXZa
         mzkw==
X-Gm-Message-State: AO0yUKWxtILlPU6MqOfTYsLmdUINiuvNIpzBGfeRPo9CRGzIyOzwK0ps
	7ATvzoMZ9lmQu4oD8c9U/so57ahjXG0=
X-Google-Smtp-Source: AK7set/3DhE0tKDVCcHiUfpLe+K5WzyUr4I0SGGV9dP2fXjYlP2nRsnvo2cObxOf8d1mq3DTbzyUhA==
X-Received: by 2002:a05:622a:1191:b0:3b8:2e48:921a with SMTP id m17-20020a05622a119100b003b82e48921amr25383085qtk.57.1677201278300;
        Thu, 23 Feb 2023 17:14:38 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id t128-20020ae9df86000000b0073b8459d221sm4698412qkf.31.2023.02.23.17.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 17:14:37 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Thu, 23 Feb 2023 20:14:21 -0500
Subject: [PATCH b4 v2] ez: allow sending all versions of a patch series in
 the same thread
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230219-send-iterations-in-same-thread-v2-1-3ae4ac504e07@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGwP+GMC/42OQQ6CQAxFr2K6tgoDJODKexgXnaFCE2cw05FoC
 Hd34AQuf/vy8hZQjsIKl8MCkWdRmUIe5ngAN1IYGKXPG0xhqsKUHSqHHiVxpJRRRQmo5BnTGJl
 6dE1BlXU19x1DllhSRhspuHHTvF+aMufPnjQ7NuIV+SGfPeEGtoZ7vo2iaYrfvWou98+/AXOJB
 TadbTPfGrbNdfAkz5ObPNzXdf0BfRLFyvIAAAA=
In-Reply-To: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.13-dev-18cd1

Some projects prefer further iterations of a patch series to be sent in
the same thread as previous ones. Usually this means that the cover
letter of v2 is sent as a reply to the cover letter of v1, etc.

Add a new config option for 'b4 send', 'send-same-thread', defaulting to
False, and read its value in get_prep_branch_as_patches. When True, add
an 'In-Reply-To' header to the first mail in the series, referencing the
Message-ID of the previous iterations's cover letter.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
Changes in v2:
- removed the command-line flag and kept only the config, as suggested
  by Konstantin
- Link to v1: https://msgid.link/20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com

v1:
Sending a new iteration of a series in the same thread as the previous
one is the preferred workflow on some lists, the Git mailing list being
an example [1].

This series allows that workflow in b4 by adding a '--same-thread'
option to 'b4 send', with an associated config option.

Cheers,

Philippe.

[1] https://git-scm.com/docs/MyFirstContribution#v2-git-send-email
---
 b4/ez.py        | 7 +++++++
 docs/config.rst | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/b4/ez.py b/b4/ez.py
index 74afddc..16e1cf8 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1191,6 +1191,13 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     if addtracking:
         patches[0][1].add_header('X-B4-Tracking', thdata)
 
+    samethread = config.get('send-same-thread', '').lower() in {'yes', 'true', 'y'}
+    if samethread and revision > 1:
+        oldrev = revision - 1
+        voldrev =  f'v{oldrev}'
+        oldmsgid =  tracking['series']['history'][voldrev][-1]
+        patches[0][1].add_header('In-Reply-To', f'<{oldmsgid}>')
+
     tag_msg = f'{csubject.full_subject}\n\n{cover_letter}'
     return alltos, allccs, tag_msg, patches
 
diff --git a/docs/config.rst b/docs/config.rst
index b3ab5ca..a1c424c 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -351,6 +351,12 @@ Contributor-oriented settings
 
   Default:: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
 
+``b4.send-same-thread`` (v0.13+)
+  When sending a new version of a series, make it part of the same
+  thread as the previous one. The first mail will be sent as a reply
+  to the previous version's cover letter.
+
+  Default: ``no``
 
 ``b4.prep-cover-strategy`` (v0.10+)
   Alternative cover letter storage strategy to use (see :ref:`prep_cover_strategies`).

---
base-commit: a3281834d6d5dec44f58071fca2d22e04a97fe18
change-id: 20230219-send-iterations-in-same-thread-c50a3bc4ed9e
--
b4 

