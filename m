Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47DD3ACA45
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489692; cv=none; b=ZyuwpdxwSUBS2HmGshHs3BPRSs5yflLpPU6z8qs1dnTAzwILHubXy6EWQgNJTxsbOBCeOiK7z4TAAiDaS2jYIMW9EuFbu75rzw53vEao6g11fTcQmbdOH1q8h48dECk3mQnSfQB58OKPtHeLr+28NYCRdqhy9z8l/16N8GhuU1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489692; c=relaxed/simple;
	bh=ciD9SnP/4RqsTjLddWueo5hWhZagvq/k2jY89VQKUXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlI7ikGlhvv1q297BIUjI+U/g5NXYdCQzaMqFXYKNvd0y3IXHjP99IEAnFgfGdlNDEDeIIOi6PHPFNrzCnW8vZencjjkNjCYQRYCzf8cQ8qHeSDQr+zb2FOOZE/Vz9De8WWoqjnXRYUd/8u6jyxLHkBTZ19Jv3fhW3eihCqxhpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JV7XNf6L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JV7XNf6L"
Received: by smtp.kernel.org (Postfix)
	id 6F51A1F00A3D; Fri, 31 Jul 2026 09:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25E91F000E9;
	Fri, 31 Jul 2026 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489691;
	bh=DE+RSG6nOZYqLwk5wlGeMp8cigmrcC9rKHTV5qLjoSM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JV7XNf6LiXqCLi1ge0foQk+68ERndMz7d9cUfmjBweM3wAhVmfUkNUGmmWRu2eOPs
	 VCPSRzHnkBF6DGcs8JC7Lqh492CbmVwQGeEbR0Dd6bBbHeRCL51BhZ6AL6VBco5WOu
	 99gkHTVd1/nwwlQQZsvZaa5TrAhirjWx0sNIYRmEVynhL2QS2CcHCSIFaI9aAAxwfi
	 45qSk5Qyg5tCgazahSfSozStno4E1/tvDYEm2OwUTl5ET4GpdU8qlzHJXYsPvZyCzB
	 EfeYtsPxrWEUhVLIdIptnUcz6KVGeeswjHjJGz+0NY0qhXJFBKixviYHwZgVNSOu23
	 Jn4ZCcO+D3CFQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:02 +0200
Subject: [PATCH b4 03/27] review: close the messages database when
 auto-marking fails
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-3-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ciD9SnP/4RqsTjLddWueo5hWhZagvq/k2jY89VQKUXg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIrmt/2em7KZ+VGEU+LLwh3iF0L6Zhax3ZpgnqAS/
 PhjluKvjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIn8/8fI8M0tTNev/NS+ZI+H
 AjM2eNe8YFzxemtIPcvJtMT5i0on5TMy7EpPlSnzvfP1yKuvx6+tKtwjtf7GxP8nz3Ryr4vf3pA
 6mRsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The auto-mark block opens the messages database and closes it in its
last statement, inside the same try that swallows every failure. If
anything raises before that we never reach the close and the connection
leaks. An unreadable thread blob, a locked database or a message without
a parseable date will all do it.

The tracking UI updates every tracked series on each refresh, so this
leaks once per series per refresh in a process that stays around. Close
it in a finally instead.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index cba3a0f..da20fc4 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2596,6 +2596,7 @@ def update_series_tracking(
     # so the unread badge below never lights up for them.
     seen_bump = 0
     if thread_msgs and change_id:
+        mconn = None
         try:
             from b4.review import messages
 
@@ -2619,9 +2620,11 @@ def update_series_tracking(
                         for mid in new_msgids
                         if 'Seen' in flags_map.get(mid, '').split()
                     )
-            mconn.close()
         except Exception as ex:
             logger.debug('Could not auto-mark own messages as read: %s', ex)
+        finally:
+            if mconn is not None:
+                mconn.close()
 
     # Update message count and thread blob from the already-fetched
     # thread messages.  No status filtering here: the thread is already

-- 
2.53.0

