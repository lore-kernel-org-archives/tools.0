Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D606340416
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571231; cv=none; b=ovbSwR2jBFmUk/vQ+3lWSUuSRPuoc/1m5r2+arT+CDpYCiQxrqNQ/vONrwvYMig+5xHpQym4mtVcg14/Gfl3QuCDSL15Z4G3djF/WKsFwkJi0IPjCBGfleDmSVt6TVcgIv0qRXcl/d2I59ynefZE5NBqpVvZQGOR2MDPO4yREfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571231; c=relaxed/simple;
	bh=L9nv19ouydDxkMy4zTpa9IyLc4YDeWofpHBjRGoZtp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYhagbStXaZpzy/PFI8QVXDasOoeOdCcv7faIylh0yyQPuBqvC5bTtLSz65oD8TquwIIPTQu3+ia4UzCsg3OtQnqo6iTJcNiwbbm+QL5ncpxQ1gVOWTkXwz2tVRkIXKzZXXJRlATmTSwD5zY+x/sbRFXKXxerPLQ6uNOUcH4GXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuSQoNVL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuSQoNVL"
Received: by smtp.kernel.org (Postfix)
	id 1908B1F00A3D; Wed, 12 Aug 2026 21:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7FA1F000E9;
	Wed, 12 Aug 2026 21:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571230;
	bh=uR+ZKuVS5BNYDmoWLYNOO4yUfofwhsRJPNhA821X2tQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AuSQoNVLYNUn1+jVD7x17Qzk8J3S6uLgh6ua1BLQR2uTxfP7vBrwz2tSkP2IlVxFg
	 l7w1Sk3CPqYD03kOo5s4iCh4FiianuzkqIHJpdR6lR28DgTcIUYG3a30ofSTTtoRtX
	 tetOKg9Pg8bO/2PmjikS8Ccw+7gJ+HGsHR8AsPe8kcKrs9/7bHLDcmgOJV+f9tmYCW
	 AaboF7/oGWrMoKc89nhcntjb0BVA/Ivdki9bgvLN4ChxnZgeFIxxn3dTORz5WOC2E1
	 jfHu22Y4ncppubPAA9EMLu5gtKp/aG86yT17GbhRXvJIbmFhIIeUDSXDRSNWT8rvZT
	 s+NQdx0Gs+2kw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:42 +0200
Subject: [PATCH RFC v2 01/25] review-tui: fix rethreaded series thread
 viewing
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-work-b4-multiver-rows-v2-1-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=brauner@kernel.org;
 h=from:subject:message-id; bh=L9nv19ouydDxkMy4zTpa9IyLc4YDeWofpHBjRGoZtp8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLwpsb//XNwmRc17F3a+6T46549L3Yp5T7awqwZ0i
 YqfPfhlQUcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEPFsZ/te/MejPCJn99UCj
 8mW/1YLVgRuOyG2+tOHfljnfZRUv5Lgz/BXvOMT2Oqi6wkxr76V7atseXHgSeeeGmZCthnecs2p
 FCQMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The lite thread viewer does not put is_rethreaded into the series dict it
hands to retrieve_series_messages(), so pressing 'e' on a rethreaded
series fetches a single patch's thread instead of reassembling the series
from its per-patch message-ids.

Forward the flag through tracking_info.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_lite_app.py     | 1 +
 src/b4/review_tui/_tracking_app.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/src/b4/review_tui/_lite_app.py b/src/b4/review_tui/_lite_app.py
index 51e14378..a75536d1 100644
--- a/src/b4/review_tui/_lite_app.py
+++ b/src/b4/review_tui/_lite_app.py
@@ -551,6 +551,7 @@ class LiteThreadScreen(ModalScreen[None]):
                 'message_id': self._message_id,
                 'change_id': ti.get('change_id', ''),
                 'revision': ti.get('revision'),
+                'is_rethreaded': bool(ti.get('is_rethreaded')),
             }
             identifier = ti.get('identifier', '')
             if identifier:
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 5b7a7563..9f0a0302 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1704,6 +1704,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 'identifier': self._identifier,
                 'change_id': self._selected_series.get('change_id', ''),
                 'revision': self._selected_series.get('revision', 1),
+                'is_rethreaded': bool(self._selected_series.get('is_rethreaded')),
             }
         self._focus_change_id = self._selected_series.get('change_id')
         from b4.review_tui._lite_app import LiteThreadScreen

-- 
2.53.0

