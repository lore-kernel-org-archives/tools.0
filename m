Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A63303A04
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146611; cv=none; b=HwHafeNhddqTwuE5V3EbQZk9zjI9l6Vc6RZ2ZeO3wz7OivDeEjoA6OYJr2p9kzSntdjUBOqKlb6GGGDOp84WPiPWsGffOeWrgrPDJPXwVlcSFTKT20ktUo9lsdvggnZ3TM8+OewXsZ7YfH8aPcRMwmkhDjbAOu0J6kjIB4VMuUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146611; c=relaxed/simple;
	bh=N4hdwxpwWUpm38pwAo0co468qErJG48wySCbx6wkLS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zv8+8sPRwvAKkvc3bW3c9rq+c8eoDUKErYom+KvYG+HHMYHTifM7I7n/oXBhDMKrK5LFHCJ7bA6W+KfWf5Rc2BHuPNACwhGnn3H8Ps/yFsLKEge2ncuJLiHUTbb/Xnclvx8sZjgLrBzndVX4ecG7Utltcd8YFxNj7FLQjtLbU64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8vGboAc; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8vGboAc"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12db2e9b5a7so192825c88.3
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146609; x=1777751409; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=so1u6GNS4hcmBtfK1f5f5IDJWCgcersad/BkVkiPVnM=;
        b=f8vGboAcaXmkIJprdYHlZeBkXdMaIJdcY9KZJLxAH/BX2yiFiU5QJD4gObDIKZzMEf
         EDnnJhgOkxGekLu0YbbjKTyA/mXJWDR6mIkHQ6+JV683IMl7cEiIp6xhq0yPApLAEhM4
         MgvuiRHu34ZUC31rfmwzmnC4DWznLaCX2gEsPawQd23H93rhQX8aCBn0YAefh583Y7nF
         nkt5CcVnv4qKVxjgKVZQsJKpzuGUwB6pQlzcwoP4pZqIZwe+RXfyJ2u8XzgnqKWpfDOV
         Tvsl1EQGAjWylU5S3YTRwCDPoKLAK8oVEw6xu9rCbIQuS6NpSSljn4BK6+UNYcCZnbJL
         m/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146609; x=1777751409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=so1u6GNS4hcmBtfK1f5f5IDJWCgcersad/BkVkiPVnM=;
        b=Y10PwaDKH7dvL88ZHRUqypCE5gzEBVeNcInwqMVA3x9WJaTLsgC+Lz2N5Rl5Y7uPfA
         r+NavdYCEV9kEJvgFbhjhcbCNgLeYRFLjYWO0lBp0N4NF0BA1pDYmgkdE9wFQWKBWRox
         UWD8LUhWnIE75B/G75VEa1vybn/AxTiqEYtrbXd7OKlhDNapH7i2BwvxIhNSuXEyDayd
         eIwhkYrsj1T1j7R8kFqdJxQv+Gqb2U4B9pRs/2X/ddyJA09DVcIu3FcTFtSmRpMGvKHo
         YCY7ks7q5RhsFTHN2Up8XqSFHLc2oByjBBbSKIwxoKCDLA9851SF/t6gqLaqv/bkfZa3
         28hQ==
X-Gm-Message-State: AOJu0YyeOpfHN746GNZGZ/RhHZWdd2QlViPg0nNNW9JAgkiqeGHBgBha
	dhxZtn5/1kPC83SIXmO0O8VYN0YskrzP1r77p1FVHx7KesDEah8cDhbIGQ3JUg==
X-Gm-Gg: AeBDiettFCtgN2rtuT9tBciMr7zmbyMs22RU3z09P2uyQNGx540lRa9SC1FViH5gEoE
	6WqdiHHz738t6LPEQy/52o9VjuwlfJe8l8cpUCZDx5/p5vlC9qA7FCNKdWwRxfwAgvz+5D80Omy
	1TFvD5joRniP05vOxEWqqQg1Yg1INHlaFN8z06mAOTkdBmNYI+eScq5VwvnS3Slaf9lAhkqoC2B
	az50h7rR0xLlUixgkQl+rKbJ3ztYqZpSn/y7plU9bcEz0pDJqxXmbxAn+QeutV7L0XBIWr6sR2t
	ohVDI+SF0A9jvfapPM1ZVLqWGHBEldP6DxohPcQifHDOCCiKmr+Sx5JytYgt75eMnJ4jn05vS9k
	lPN/XhHStWB7WRzLF4jPR/1khegoprnwhtmSuoILz4gzl5Mz0zPaXi8u8f67V+kvpKTDkhnfvI8
	+X7gBSkxah/GQ6Ye8VrmaPwxCFGEHd3OUNdh6ZgsAgH0EKfyf3y61pqsCYR+0nKD/TKfrEPRals
	dEtBL+ACbwUbSlLK4YideCG
X-Received: by 2002:a05:7022:221e:b0:12c:90f9:4da0 with SMTP id a92af1059eb24-12c90f94eebmr5508508c88.3.1777146609317;
        Sat, 25 Apr 2026 12:50:09 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:08 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 12/13] review_tui: write git tracking commit before updating DB
Date: Sat, 25 Apr 2026 12:49:40 -0700
Message-ID: <20260425194943.1499-13-lutgaru@gmail.com>
X-Mailer: git-send-email 2.45.0.windows.1
In-Reply-To: <20260425194943.1499-1-lutgaru@gmail.com>
References: <20260425194943.1499-1-lutgaru@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The background rescan_branches worker reads the git tracking commit and
writes the status it finds back to the DB.  Both action_review and
action_waiting previously wrote to the DB first and updated the git
tracking commit second; if the rescan worker woke up in that window it
would overwrite the DB row with the stale status from the old commit.

On Linux this window is rarely hit because epoll wakes the event loop
only when I/O is ready.  Windows uses IocpProactor, which processes
completion callbacks eagerly and causes the background rescan task to
be scheduled between the two writes reliably, making the race
consistently reproducible in the test suite.

Fix both actions so the git tracking commit is always written first.
The rescan then reads the already-updated commit and any DB write it
performs is idempotent with what the action itself is about to write.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/b4/review_tui/_tracking_app.py | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index a5a9389..d52a49b 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1245,16 +1245,20 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                             conn, change_id, 'reviewing', revision=revision
                         )
                 elif status in ('waiting', 'accepted'):
-                    # Bring back to reviewing on re-entry
-                    if conn:
-                        b4.review.tracking.update_series_status(
-                            conn, change_id, 'reviewing', revision=revision
-                        )
+                    # Bring back to reviewing on re-entry.
+                    # Update git FIRST so that any concurrent rescan reads the
+                    # new status from the tracking commit before we commit it
+                    # to the DB; this prevents the rescan from overwriting the
+                    # DB with the stale status on the next wake-up.
                     topdir = b4.git_get_toplevel()
                     if topdir:
                         b4.review.update_tracking_status(
                             topdir, branch_name, 'reviewing'
                         )
+                    if conn:
+                        b4.review.tracking.update_series_status(
+                            conn, change_id, 'reviewing', revision=revision
+                        )
                 # Clear the followup badge — user is about to read this series
                 if conn and self._identifier and isinstance(revision, int):
                     b4.review.tracking.mark_all_messages_seen(conn, change_id, revision)
@@ -4078,6 +4082,12 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
             return
         change_id = self._selected_series.get('change_id', '')
         revision = self._selected_series.get('revision')
+        # Update git FIRST so that any concurrent rescan reads the new status
+        # from the tracking commit before we commit it to the DB.
+        topdir = b4.git_get_toplevel()
+        if topdir and status != 'new':
+            branch_name = f'b4/review/{change_id}'
+            b4.review.update_tracking_status(topdir, branch_name, 'waiting')
         try:
             conn = b4.review.tracking.get_db(self._identifier)
             b4.review.tracking.update_series_status(
@@ -4087,10 +4097,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         except Exception as ex:
             self.notify(f'Error: {ex}', severity='error')
             return
-        topdir = b4.git_get_toplevel()
-        if topdir and status != 'new':
-            branch_name = f'b4/review/{change_id}'
-            b4.review.update_tracking_status(topdir, branch_name, 'waiting')
         self.notify('Series moved to waiting')
         self._focus_change_id = change_id
         self._invalidate_caches(change_id)
-- 
2.45.0.windows.1

