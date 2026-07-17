Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C7246BD5
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327902; cv=none; b=lxjl8FDMs3PLA+4HdsvQMUWMNfdms19wpPhuqpmlEtUQjHvoTGidJ8X2RdkGlTMMDjfPiT4j+Wv37mqY0HmhkXxGnNofnwVuZhqwx6tpRh36jknG6EHV/8ZH2V3uiQVfw4mk9RtyqFuslR55xo4k29LhRzch6n5ek5Q9DSiLI/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327902; c=relaxed/simple;
	bh=DJSxJ6FPdnzBxqGQ7XQHt3obJuLcIYJQOFDLbNj1ww4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTRcqnwDpSrb0UvaTMkyZPQxuG79Qr6ER/gdnz+VxkzaSYGGi0Q5l1RA1080OoFdWUAcjJyxB6G+5pAN1tkOIv7PcRsC9IszoQNtV/kcG6ABI/SAOokIs+CWVxvU/aBxBEbPDr5yiTtDk6D+YBuf0/eP27OwEkP6PsP2yQCV+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xof3t5M3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xof3t5M3"
Received: by smtp.kernel.org (Postfix)
	id 175EA1F00A3A; Fri, 17 Jul 2026 22:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1A31F000E9;
	Fri, 17 Jul 2026 22:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327901;
	bh=77dfG39Efmo21tXGTidCGEZ+6w5ZbbAV8fKByfh6/30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xof3t5M3P2XW5VVEmzNZEsOREwKyQ5DRtGh+K/M+UxAZSRAYR55rWIUEYId/DS++5
	 G4fM/dfV7ijJB5ozmk/iaOAu/P6A4KU/ErdkpPwd+4R/2B/8RkNfRrvDpQMv+ik2g5
	 UByX4zF7HSCFDwwprUwjxPjpYx6npHElH/ShBHGD/rJ3capZb8wKTmCff27OKYTH9j
	 TUMpLpQyCZ+LBInDWxpzPFSluwaMFjLkhQ7X8YEuTBfoLG5P0YUGxkQR0YGdSt9xbH
	 B6hJGxi8RaoU/HxHZBS/8yr1j/iyZREjT1NWsX3nV/9JmIXhn5162y0nRBk61dIZTF
	 FiMuAS1c3wUyw==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:37 +0200
Subject: [PATCH RFC 01/11] review-tui: fix rethreaded series thread viewing
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-work-b4-multiver-rows-v1-1-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816; i=brauner@kernel.org;
 h=from:subject:message-id; bh=DJSxJ6FPdnzBxqGQ7XQHt3obJuLcIYJQOFDLbNj1ww4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbu5XWQuo620zm2jSacfhB76cC02xj/feUNamH2Pb
 4hdmua8jlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIlcV2T4Z/9d4VpJFfOuFsOS
 wPUcQs4MRR0B/s95GH8Kz2U8ds/sMcMfjujwTkb3j8FX/2cJWErOOfTwx+Zk59BVVWcqOnUDy3W
 5AQ==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The lite thread viewer never put is_rethreaded into the series dict it
hands to retrieve_series_messages, so 'e' on a rethreaded series
fetched a single patch's thread instead of reassembling the series
from its per-patch message-ids.  Forward the flag through
tracking_info.

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_lite_app.py     | 1 +
 src/b4/review_tui/_tracking_app.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/src/b4/review_tui/_lite_app.py b/src/b4/review_tui/_lite_app.py
index 9c418ad..b14d110 100644
--- a/src/b4/review_tui/_lite_app.py
+++ b/src/b4/review_tui/_lite_app.py
@@ -549,6 +549,7 @@ class LiteThreadScreen(ModalScreen[None]):
                 'message_id': self._message_id,
                 'change_id': ti.get('change_id', ''),
                 'revision': ti.get('revision'),
+                'is_rethreaded': bool(ti.get('is_rethreaded')),
             }
             identifier = ti.get('identifier', '')
             if identifier:
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 7e7f142..7bf9530 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1547,6 +1547,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 'identifier': self._identifier,
                 'change_id': self._selected_series.get('change_id', ''),
                 'revision': self._selected_series.get('revision', 1),
+                'is_rethreaded': bool(self._selected_series.get('is_rethreaded')),
             }
         self._focus_change_id = self._selected_series.get('change_id')
         from b4.review_tui._lite_app import LiteThreadScreen

-- 
2.53.0

