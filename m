Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20281435A96
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 20:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665274; cv=none; b=R1rLbSwWScyZ6JCc436T29Ui1ee7dR8cw+x2HASIy4Y7akcu0ojMZRIpbq7BZJIeGlyvxJM4B9BLMtYo/KfqATPVL+yQ2FHgtrJ2PSId3gmjMUe7lvgCaw3YoXUmB3NqrVQDnVLH5ykSBmlyUq3m2Qp1HKcaYdxhiHDoPLepGHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665274; c=relaxed/simple;
	bh=I62pcH8AI4wVsYS37bDX/X0vgKZ50Y7R/PEDstZKL2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iODzsDPNy6YI1Z2GRuc12xSyFr3KOBUJdmY2eZ5c+i4dGBcSgsCtbO75hSy3gLwiqkhdPKkOgx+pFprAeVNPH0CKfE57TUL2itSLEtxhdsP7EfDjkmgC5JS5nQalXE0KP4ePNvaSeCJZAYGAn1WUvGpPeGacl5BmVLsvxfxjKkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpmgcpWt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpmgcpWt"
Received: by smtp.kernel.org (Postfix)
	id 041641F00A3D; Tue, 21 Jul 2026 20:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F49D1F000E9;
	Tue, 21 Jul 2026 20:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784665272;
	bh=JExv3iorH55lMnPHUXDdW5fbCAuGWlYpNa4ixvtMdAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JpmgcpWtXrrUysJGKN7Wo+27opcmWk0vRXYZwDm1Sa3659CHgHj05dlJhmQ9I+nd1
	 O4JLW4mTi1487Zi3Qrml4H2mlTva/ZzfnJQkXH69vI6ibq+paTHbokGDX9pgx7wuVr
	 0ZHGJ+9T7MypkYH29b445JNvARHbhsFei6Iz1S7PTmTf7LjP0+1pbco1ARwcFknahT
	 ha5MnYmbuXZzVV/zWTsrrhBS7aWPtNI8fNMsgYOeNgIbWJD9S9DXzzqeOvhnEox1QO
	 +qnwbgzpT28osKWmIhrzYOzVXM821bcQ6fzsSwTy0zchK69Gj+uJQhC/9juqXOnfQo
	 jvYum8xravxpg==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 21 Jul 2026 22:21:02 +0200
Subject: [PATCH b4 2/4] review: test the applied-series message-count
 refresh
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-work-b4-accepted-unread-badge-v1-2-28581acc4988@kernel.org>
References: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
In-Reply-To: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=4036; i=brauner@kernel.org;
 h=from:subject:message-id; bh=I62pcH8AI4wVsYS37bDX/X0vgKZ50Y7R/PEDstZKL2k=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTFX9kqIfbPRF3HLmVSP9+Kzpth674x6bx7u/f4pFvRt
 ecfFO3r6ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiI9D6G//kM1z5I5i/wjLq5
 WHSb8IY9qXsl516RtstP4e1jXPMgoI+R4Zrv/n9PDh2f0q3kFbNic8n3ix1XUu8yP59yUvmg0K2
 l8zgB
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

An accepted series run through update_series_tracking() gets
message_count refreshed from the fetched thread while seen_message_count
stays put, so the unread badge appears for follow-up mail on applied
series.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review_tracking.py | 81 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index bcf8745..c3ddd33 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -2908,6 +2908,87 @@ class TestUpdateSeriesTrackingCancellation:
                 )
 
 
+# ---------------------------------------------------------------------------
+# Message counts: update_series_tracking
+# ---------------------------------------------------------------------------
+
+
+class TestUpdateSeriesTrackingCounts:
+    """The message count is refreshed regardless of series status."""
+
+    def test_accepted_series_still_updates_counts(self) -> None:
+        """An accepted (applied) series still gets its message count refreshed.
+
+        Regression: the count update used to be skipped for
+        accepted/thanked/snoozed series, so once a series was applied the
+        unread badge never appeared again — new follow-up mail was fetched
+        on update but message_count stayed frozen.
+        """
+        identifier = 'count-accepted-test'
+        change_id = 'count-accepted-1'
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id,
+            1,
+            'Subject',
+            'Author',
+            'a@example.com',
+            '2024-01-15T10:00:00+00:00',
+            'cover@example.com',
+            3,
+        )
+        review_tracking.update_series_status(conn, change_id, 'accepted')
+        # Baseline from the reviewing days: 5 messages, all seen
+        conn.execute(
+            'UPDATE series SET message_count = 5, seen_message_count = 5'
+            ' WHERE change_id = ?',
+            (change_id,),
+        )
+        conn.commit()
+        conn.close()
+
+        # The refetched thread has grown to 7 messages
+        msgs = [_make_test_msg(f'reply-{i}@example.com') for i in range(7)]
+
+        v1_patch = mock.Mock()
+        v1_patch.msgid = 'cover@example.com'
+        v1_patch.full_subject = '[PATCH 0/3] test'
+        v1_mock = mock.Mock()
+        v1_mock.revision = 1
+        v1_mock.patches = [v1_patch, None, None, None]
+        mock_lmbx = mock.Mock()
+        mock_lmbx.series = {1: v1_mock}
+        mock_lmbx.get_series.return_value = None
+
+        series_dict: Dict[str, Any] = {
+            'change_id': change_id,
+            'revision': 1,
+            'status': 'accepted',
+            'message_id': 'cover@example.com',
+        }
+        with (
+            mock.patch('b4.review._review.retrieve_series_messages', return_value=msgs),
+            mock.patch('b4.LoreMailbox', return_value=mock_lmbx),
+        ):
+            result = b4.review.update_series_tracking(
+                series_dict, identifier, 'https://example.com/%s'
+            )
+
+        assert result.get('error') is None
+        assert result.get('counts_updated') is True
+
+        conn = review_tracking.get_db(identifier)
+        row = conn.execute(
+            'SELECT message_count, seen_message_count FROM series WHERE change_id = ?',
+            (change_id,),
+        ).fetchone()
+        conn.close()
+        # Count refreshed, seen untouched — the badge shows (2)
+        assert row['message_count'] == 7
+        assert row['seen_message_count'] == 5
+
+
 # ---------------------------------------------------------------------------
 # Cancellation: cmd_track
 # ---------------------------------------------------------------------------

-- 
2.53.0

