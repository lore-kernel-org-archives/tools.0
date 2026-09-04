Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E64DF4D5
	for <tools@linux.kernel.org>; Fri,  4 Sep 2026 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533996; cv=pass; b=LwtrkrrV2fvj8x2KTVjrXb3iHv0kkd4q/HuruoBa1FTy8tpMmydJn9JZmERrw3xR4WH0kgZsjmwIzEp7Cq8W+8xE2Y951w0oxgHJvEtGEiCadBpa+06FVeQDEmCGM1nkxEU/jxt9Gwsh7b5PzMXVbeHOZkVOlFeVleBE1XRMNv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533996; c=relaxed/simple;
	bh=76ThiqkQzKda/d7gjmYy7nqfnKhmJ4KIqh4K+qWCwtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9+UsGOYm/aRQYbE4nPoUz3b5fP7V+iMl2bdu5oY9QsEkGaOwEX0mf9rL17BHklwRbz6lRMm96x3hAAMjeXKAvdPpVFmWyR2lmrf19tZYVMX3I9tUM0hUsZ/YJxpcg50f2/LuhGG99MI6P0Dltaa3wQZ4Q8FP5KDonbKOZkkF9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=dyL1nsf6; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="dyL1nsf6"
Received: by smtp.kernel.org (Postfix)
	id 0DCE91F00A3E; Fri,  4 Sep 2026 14:59:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=130.117.225.111
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788533994;
	b=2f5HMufY9G26eiem+VqeduZfzhGuPGYEAE0c3ldVID377MrQhtbooRCWrAq5eJfdSVST
	 2LJqhvUKLM3tRDbgHOeSFnnAwy9VD6j2ANaGE1zXuD5KOKhWLMlt+MYy2azFLAmOaFYAc
	 he6OFNQudUycRZXYg0Zhax1CJUd0eCnyIhicQiaNG1gkbscOHOVIBWjhSZhCBCeKkCEIs
	 VcB9SJ8Y9yAoyKZv/xGI2bJhNHr9kLoPeV3dNRGyBgOPddHD9V6OY01h7f5digCvJRqLS
	 4gZ/JxshDwFNXHx1fqyTW8VH0Gjete9l3fr1jZ6GOKTKGrZ4ZN+vqZ9Qmb885ZP2utw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788533994;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=peRndLneVeYp+Qjo4YtTiAdmsTnZZjaCJt4ozoryvNs=;
	b=WGp58c+jSIU0tAhCrfZMa/IuamM+goMiIxJ/l+BX137XD9zveoE/OlkjgklT4lT3vGFd
	 Yqq8ChPm1rfPCPui+eAnRykDzLjYkyO2LZcVav+6+WEBTHAZOoELQQE3cAnxN5gykI6ef
	 xjArfvFQ4rzJaFCMqa/24vjPpK8Jyzc96LhP3ZxDKJHUVMcv+dDLpwYfxLQtbduWazpKm
	 vOkEMo6N05Bz0OUb1Zpicc16wCYKWsp+5D3v9bI0TyXU0KXJKBtzSQNFpK9LzP6gsFwI0
	 /kOba5E1cZ7jU2Rhxy/JvuQdwVdtmLyKcSCTBWMz9UqkI2ke0RusMGEgCebTOVyDDow==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=dyL1nsf6;
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=none smtp.remote-ip=130.117.225.111
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BD611F00A3D
	for <tools@kernel.org>; Fri,  4 Sep 2026 14:59:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=dyL1nsf6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1BD611F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=peRndLneVeYp+Qjo4YtTiAdmsTnZZjaCJt4ozoryvNs=; b=dyL1nsf6djj6
	66SeKigwwH47eoVFd+8Cg4EkY2qEtGyTILXpIW2NMRpglpL3+5bhVFAmn3uDhGcrKA+gTNks0Wquu
	ADT+c3B0jbF46orDvRRttwy2p/B4xDBAFMj5J+/N+sz+jBKiUOuyiklK9fiJpuRQtZsKwOT+Tkjj4
	V1tblxqNDJ6T8W0mYD3kPUs3LztWbokGh9/mbX+JtbiFcq6Pp/Qi5uowsOUF0y2ngqP8Yvon2khUi
	9GjPCqqX4OcKkQ4zpBsatwJWzW7H7pHbMGZnhABIntxdjubQdJBBKSwlvjuf2LK2RlNBgkQJXcL5I
	nxAOWV8aV4oq2roq+tncdg==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.vzint.dev)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1x2VLz-006gpa-1D;
	Fri, 04 Sep 2026 16:59:47 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
To: tools@kernel.org
Cc: Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH b4 2/2] review-tui: read native_ansi_color for the trailer overlay header
Date: Fri,  4 Sep 2026 16:59:51 +0200
Message-ID: <20260904145951.1414701-2-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904145951.1414701-1-khorenko@virtuozzo.com>
References: <20260904145951.1414701-1-khorenko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The review status overlay picks its reverse-video header style off
App.ansi_color, a tri-state that stays None until the theme is
switched at runtime, so it never reflects an ansi theme set via
TEXTUAL_THEME and the header falls back to the wrong style. Read
native_ansi_color instead, with a getattr fallback for Textual
releases that predate the property.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
Assisted-by: claude-sonnet-5
---
 src/b4/review_tui/_review_app.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index e1082e9..da60455 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -924,7 +924,7 @@ from b4.review_tui._modals import (
 
             if has_content:
                 text.append('\n')
-            if self.app.ansi_color:
+            if getattr(self.app, 'native_ansi_color', self.app.ansi_color):
                 text.append(f' {header} ', style=f'bold reverse {colour}')
             else:
                 text.append(f' {header} ', style=f'bold {ts["surface"]} on {colour}')
-- 
2.43.0

