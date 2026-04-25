Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7474C303C83
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146612; cv=none; b=Z9FmQgQgHm6eag5vWdPCpO10pTpG9yQXFlsL8Gr26vJl+rtzSNClYJR7jJ7CwlzhTy/s0M0dKsF0r8yKITpnnZ1cqj2p0gGYzmfu6THT8wmpafkuUKdwAyYse4XZhk25zBMUqlFGMuQwsGChSLOaGxD3ZLt2Aslnz3EvsE/cOGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146612; c=relaxed/simple;
	bh=ZuWxhIKZ+vw2Mqh3u9sXzH+OQlFxzTPCJZGoYEWBxDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2Jp9XzRNDeSkS2RBKgEorqai5SY1E+N2vPgbQy1GZw5XGrpG74jOgZeOq6KgAuMqwOUohucxBp1dUiGej/bz4NmUsWrUfQNUp3tjD2kx6Ps/VBB4BR3F923F7ABqbtkGm/PnzsIKJ3AAGyzAOq1cfcdBSyplma+CS5wZbAT6kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3Z7Wv0h; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3Z7Wv0h"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c87f1f8c8so583509c88.2
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146610; x=1777751410; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFnNNptG9I7ygFnt6k0IKFiXbNLJiPUvXqlmJNYYgZ0=;
        b=S3Z7Wv0hciFWeBfKTRFX6X1qEqOfB8+d1cZQIMH1F1KToI45mmM9Q3RrLJq6TxmfvN
         S6U3Z0Vi8CN1mrb/SVLwMvhwZ8h78XjzzwwHR8pl0ITMHdRPJMalBV8yZbItUPZU2hME
         guWmngaqnkVRLXrb66zfv94QUcKiz2MZ3uqBH2lKPQZcoPIQ9ESe05Q2dmCAs1EVi2RW
         JtTU+DIccbkqYnkzAgiEdRgdhgtoyiOHOEMrfhjqT99tj5l6peHqfv9EFf0uiuxheh7G
         6Qqw7HtzQJaSwaem5ABtMeOuMs4Ha6m32gv1u+VBEkKOp2PJtPyhdY8eDkaPh2S13aOE
         Byuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146610; x=1777751410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFnNNptG9I7ygFnt6k0IKFiXbNLJiPUvXqlmJNYYgZ0=;
        b=olnG/D3x6D6luniVyAVzrg8Nw1A7VTlDt0BaYhC2bAoA9sjnmcRbnybzoBPZGFxenw
         l5bvIGnCb9yiEaNEUGvIflTZi6JoslU/J1hMffif0HpBmp0sN5svhsoeR/BP9RmnYq9W
         +MtaDUVrIOB2Xv5tOPTVUygbBWOgfKKqUIQLdtWtGTTUxgBgaP/8/VzxurlZpVkF76Gz
         M502oTSnAAlESXtEs7a47rVHPJV928FBK00BHr323Gbb2L8IOAAz1ohsbPyK48vCF6dl
         A+CHruLFqzLyS9CZoVNcne2JYyBtqurhfk2k6G8JHHGJFekHIEd5kzbA5bldj4cc2AdQ
         2daA==
X-Gm-Message-State: AOJu0YyKgdpYpNaijZy1EGL4QOqqU+H9h9kPKkNFPY4APArD9b9muIB+
	K1ftmoOF8YOsFfpSqq+fc0/roGWBHXtMrOUw0ZN7WNXMyLmsiru5B32qr5jR0A==
X-Gm-Gg: AeBDiesNxIJdkNIlNRpz/D62cVTQGljVlEqNoVO/lxsuXX5ayKyo5NDDJi1jTHl7lFP
	PtQbAR4MaVsoUD32mZHn4Gg4bB5aWE8ik1TsE84tZJER8HeSao/L65DmOBUMT+G7pLGkmdbKgk+
	mnQwYhme3ERuBTJeZsCld9q9nyXLQk+/4b3DGGNQO/0Y5lDgnhmkl5+ynm8HplxZBAPuqUyfDka
	GxNvxDf3g54GAU74UF27e2rRlgZEPsJobMeXUOcSBkyL8inxmqM8O5PvSjCmydRq4ApP85ByO+y
	7LGZRIc+n5YeGYP5VWXU/gopHupwLIQN0lx26lLwlrahBSRx57IxS6jPNuGHQ1GogBXUB6DbLNF
	XvdDrNl34ISK/9Wi00A5YvnQ1nbs9g7HWTQWZZzL/SN1w2cy1jizVv1G3Ba1VGcTFxTKwWP4WS6
	1PsuLsPOiyM9MoFQjHrgA+gHbRgL7h8MqBqDyY5zjOIzPgxEbBbmNsK5oXRicHEiI7qg1W0Vrhh
	9BxVENBxEAGWYLr9uUJ2MKV
X-Received: by 2002:a05:7022:6b97:b0:11b:862d:8031 with SMTP id a92af1059eb24-12c73e2d0a2mr6424708c88.0.1777146610408;
        Sat, 25 Apr 2026 12:50:10 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:09 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 13/13] review_tui: guard against unmounted diff-viewer In certain asynchronous contexts or during rapid UI transitions, _show_content may be invoked before the diff-viewer widget has been fully mounted in the DOM. This is particularly reproducible in headless test environments and on platforms with slower console I/O initialization.
Date: Sat, 25 Apr 2026 12:49:41 -0700
Message-ID: <20260425194943.1499-14-lutgaru@gmail.com>
X-Mailer: git-send-email 2.45.0.windows.1
In-Reply-To: <20260425194943.1499-1-lutgaru@gmail.com>
References: <20260425194943.1499-1-lutgaru@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a defensive try-except block to catch NoMatches when querying for
'#diff-viewer'. If the widget is not yet available, log a debug message
and return early to prevent an application crash.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/b4/review_tui/_review_app.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 8786fbb..e6d6e4e 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -18,6 +18,7 @@ from rich.text import Text
 from textual.app import App, ComposeResult
 from textual.binding import Binding
 from textual.containers import Horizontal, Vertical
+from textual.css.query import NoMatches
 from textual.events import Click
 from textual.widgets import Label, ListItem, ListView, RichLog, Static
 
@@ -458,7 +459,12 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         total = len(self._commit_shas)
         if display_idx < 0 or display_idx > total:
             return
-        viewer = self.query_one('#diff-viewer', RichLog)
+        # Defensive: widget may not be mounted yet in headless/async tests
+        try:
+            viewer = self.query_one('#diff-viewer', RichLog)
+        except NoMatches:
+            self.log.debug("diff-viewer not ready for patch %s", display_idx)
+            return
         viewer.clear()
         self._comment_positions = []
         self._followup_positions = {}
-- 
2.45.0.windows.1

