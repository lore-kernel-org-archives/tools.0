Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8561423E320
	for <tools@linux.kernel.org>; Wed,  1 Jul 2026 13:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913890; cv=none; b=g1Rk5ObQGlcK+LEaCg8+jtOs8C8hrRSY/RdBu7ybomrNIkjC13VYAu/QU39DtGd+t2+G56fmZFmBv0AOcv9V5vZbPamYqrVkw1mkx7enYNsUMba0qVPW3lKQZ98Rx1Mc+Y3ge5H9rIXts45gYgny4uwDtubFN0Y1lEXUTaZZnyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913890; c=relaxed/simple;
	bh=1zmb0MZO2Ti7DBZdqY94tLS/Q21/MpRPA/ZvnLe4Ebc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyX/41ilPLhsw5pPerGpnJeLDSE3BJXwgK8uM9emO1TwGiiYfrUlwUv918XZaWn6DtjU9K5bVLAwOXGPaRTMTiK1sLG0odcZgL95bVkLHE/ppCoCPlk+PZgCB6sIfzy5O7YUXBFahJdZBWOAWJq0MgbIBYaz4swiLy8r3B0ifX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTxbSiMO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTxbSiMO"
Received: by smtp.kernel.org (Postfix)
	id 8251E1F00A3D; Wed,  1 Jul 2026 13:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF60C1F00A3A;
	Wed,  1 Jul 2026 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782913889;
	bh=ELhr38DBufurqfTvWPqXHOQlYc266Sufe4RTnH2X/iM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mTxbSiMOWaPZg9afX/tdR7zWtucMyyaxkrEE1HjvSdsba34rLbOxz5Qc0oYbKMh/Q
	 hFhSjrOriqOMyKNOIu3H+rfAFdx/myUXIYwW5RJqDln/El1xglG82ojViEE54f0PNI
	 7m9VrkhI0avIZFiSMzKzvfv4nEZSoaIa4GaLq2nF6bCOh+2ZK2stYuoEF2OFVhF4ro
	 +WrbToPItlEL60Wx7SYgMtbAQnVFx2Begr5QXFv/B5MY2nCoznKq1HmT8YRUUNDUV7
	 Xa4NsDEAtn9HJykiJkPIk2DjiHcWpnhSlZgwubBHCnJn0jv6TwdeBlSWqatH6lO4jT
	 W30n+KjW4fPIQ==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 01 Jul 2026 15:51:22 +0200
Subject: [PATCH b4 2/2] tests: exercise naked cover-letter detection
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-work-b4-naked-cover-letter-v1-2-f651c2ffb63b@kernel.org>
References: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
In-Reply-To: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=5629; i=brauner@kernel.org;
 h=from:subject:message-id; bh=1zmb0MZO2Ti7DBZdqY94tLS/Q21/MpRPA/ZvnLe4Ebc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS5SsdGlqvpvIg5ftih1fB65d+FzHc/i7Hf6Epnkap2c
 V/acC+lo5SFQYyLQVZMkcWh3SRcbjlPxWajTA2YOaxMIEMYuDgFYCKtCxkZfivM8+S8Ff/lyJyk
 e//ZbZi3L1lzeOHuede/XU9pVt67tJiRYfumPVnais097+03Xy3yapxzeOYeHSu3xU/TFnZf/Kq
 dzwwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Add fixtures and a test for the naked cover-letter fallback in
get_series().

The positive fixture is a single-patch series whose cover has neither a
[PATCH 0/N] prefix nor a diffstat; get_series() must still recognize it
as the cover via the same-author thread-root rule.

The negative fixture is a patch sent in-reply-to a third party's bug
report; that report must not be mistaken for a cover letter, so
has_cover stays False and patches[0] is None.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/samples/naked-cover-bugreport.mbox | 47 ++++++++++++++++++++++++++++
 src/tests/samples/naked-cover-single.mbox    | 44 ++++++++++++++++++++++++++
 src/tests/test___init__.py                   | 32 +++++++++++++++++++
 3 files changed, 123 insertions(+)

diff --git a/src/tests/samples/naked-cover-bugreport.mbox b/src/tests/samples/naked-cover-bugreport.mbox
new file mode 100644
index 0000000..17dd29b
--- /dev/null
+++ b/src/tests/samples/naked-cover-bugreport.mbox
@@ -0,0 +1,47 @@
+From mboxrd@git Thu Jan  1 00:00:00 1970
+Subject: widget subsystem corrupts data under load
+MIME-Version: 1.0
+Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+From: Bug Reporter <reporter@example.com>
+Date: Tue, 25 Oct 2022 13:38:41 -0400
+Message-Id: <20221025-bugreport-widget@example.com>
+To: list@example.org
+
+Hi,
+
+I am seeing data corruption in the widget subsystem under load.  This
+report has no diffstat and no [PATCH 0/N] prefix, and it was written by
+somebody other than the patch author, so it must not be mistaken for a
+cover letter.
+
+From mboxrd@git Thu Jan  1 00:00:00 1970
+Subject: [PATCH] widget: fix data corruption under load
+MIME-Version: 1.0
+Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+From: Test Author <author@example.org>
+Date: Tue, 25 Oct 2022 13:38:42 -0400
+Message-Id: <20221025-widget-fix-author@example.org>
+In-Reply-To: <20221025-bugreport-widget@example.com>
+References: <20221025-bugreport-widget@example.com>
+To: list@example.org
+Cc: Bug Reporter <reporter@example.com>
+
+Take the lock before touching the shared widget state.
+
+Reported-by: Bug Reporter <reporter@example.com>
+Signed-off-by: Test Author <author@example.org>
+---
+ file1 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/file1 b/file1
+index 0000001..0000002 100644
+--- a/file1
++++ b/file1
+@@ -1,3 +1,3 @@
+ line 1
+-line 2
++line two
+ line 3
diff --git a/src/tests/samples/naked-cover-single.mbox b/src/tests/samples/naked-cover-single.mbox
new file mode 100644
index 0000000..fa7baad
--- /dev/null
+++ b/src/tests/samples/naked-cover-single.mbox
@@ -0,0 +1,44 @@
+From mboxrd@git Thu Jan  1 00:00:00 1970
+Subject: do a thing to the widget subsystem
+MIME-Version: 1.0
+Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+From: Test Author <author@example.org>
+Date: Tue, 25 Oct 2022 13:38:41 -0400
+Message-Id: <20221025-widget-v1-0-author@example.org>
+To: list@example.org
+
+Hi all,
+
+this changes how the widget works.  Note that there is neither a
+[PATCH 0/N] prefix nor a diffstat on this cover letter, yet it is
+still a genuine cover letter for the single patch that follows.
+
+From mboxrd@git Thu Jan  1 00:00:00 1970
+Subject: [PATCH] widget: do the thing
+MIME-Version: 1.0
+Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+From: Test Author <author@example.org>
+Date: Tue, 25 Oct 2022 13:38:42 -0400
+Message-Id: <20221025-widget-v1-1-author@example.org>
+In-Reply-To: <20221025-widget-v1-0-author@example.org>
+References: <20221025-widget-v1-0-author@example.org>
+To: list@example.org
+
+Make the widget finally do the thing it was always meant to do.
+
+Signed-off-by: Test Author <author@example.org>
+---
+ file1 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/file1 b/file1
+index 0000001..0000002 100644
+--- a/file1
++++ b/file1
+@@ -1,3 +1,3 @@
+ line 1
+-line 2
++line two
+ line 3
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index cb34d1f..f9deb5d 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -393,6 +393,38 @@ def test_followup_trailers(
         assert ifh.getvalue().decode() == fh.read()
 
 
+@pytest.mark.parametrize(
+    'source,expect_cover,expect_subject',
+    [
+        # A cover with neither a [PATCH 0/N] prefix nor a diffstat is still
+        # recognized when it is the same-author thread root of the series.
+        ('single', True, 'do a thing to the widget subsystem'),
+        # A patch sent in-reply-to someone else's bug report must not mistake
+        # that report for a cover letter.
+        ('bugreport', False, None),
+    ],
+)
+def test_naked_cover_letter_detection(
+    sampledir: str,
+    source: str,
+    expect_cover: bool,
+    expect_subject: Optional[str],
+) -> None:
+    lmbx = b4.LoreMailbox()
+    for msg in b4.get_msgs_from_mailbox_or_maildir(
+        f'{sampledir}/naked-cover-{source}.mbox'
+    ):
+        lmbx.add_message(msg)
+    lser = lmbx.get_series(codereview_trailers=False)
+    assert lser is not None
+    assert lser.has_cover is expect_cover
+    if expect_subject is None:
+        assert lser.patches[0] is None
+    else:
+        assert lser.patches[0] is not None
+        assert lser.patches[0].subject == expect_subject
+
+
 @pytest.mark.parametrize(
     'hval,verify,tr',
     [

-- 
2.53.0

