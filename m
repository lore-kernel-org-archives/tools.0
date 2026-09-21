Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984073EFFC0
	for <tools@linux.kernel.org>; Mon, 21 Sep 2026 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015657; cv=pass; b=kOQXX2qTVDgbel9B1JpKFrvXi7V/RZSNud8zNp0+gfRJBTJGy5jZcQOEys2RmQW9dgU/jF+dDNUQsF0gNXJPZgjijuDMoHIhoV/qXO/yeUcmLH3/GKY8FwWIVe75KLE2b+ANUZIrneKbzultU5Xy33SLpS/wMTuz/osGWuO+bQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015657; c=relaxed/simple;
	bh=NaN5ZVuyvy2qecxGIGfjCX31WPp4LoyFXYfet9cs4os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YSWHqo54VPIPwP748v740iAxFfOHffToQYQRA4hYJATusIlGSHNeR9vuUKfrdRIiVZuGHB84powqIgkslqdh+WrHQWQ4Hr9HcA/riYwkgdFarKUgGYmT/+bT5l8Pk4p6gLTU3GKyjCSRk/1OTFvX/YC+sRUxVZOO/1mvvrsQ6TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=n5EUOhoX; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="n5EUOhoX"
Received: by smtp.kernel.org (Postfix)
	id 4836D1F00893; Mon, 21 Sep 2026 18:34:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=130.117.225.111
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790015656;
	b=u0R12CfJ/t68AewLJrgOqhOsbyAO6ecjtiJ0HgMM63+s/GajIhBURwByezxVQsSWPzc1
	 O60SUpbK1l9b7+NE02RGzxMz23J8xhMIMTGG9Y1hJ92T5MLNMDmVQjW4lnJBhsPUCitBo
	 5tRwmYrQ7gshGG0YNdc67dIBurUXdyZxbdKmcYgGJJ7hKasGwMzlWQ8gR0HyOkniaxA56
	 7hlAQHliSwxNVHhweK8IAys8cMIxA5L//aAA23TWnTQOPJugE6LjdhQKjCWYRE+/XJwTo
	 9i5uh4Ny3qnocg5Z6yfhQnnb69pmVMudf45GFDrx8jDH4ZSvLUYZNFq1PK1fDosIOLw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790015656;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KgO+eNyCB8QuHZFTr4wiRIm8potuWTwjJr2H53yLmLw=;
	b=VX7T/hN3vFGTKubp6HMO8+5cKXk8+w67AWrYvYnhS5Hi11xRohCAaQObXat0yMII58Kq
	 nVnNLOH4cM3nw/QLpyq0SYBvi4PKzRfK6kxuKoATcWwa3O08rJ0MlR47N80zD/rhoFFzH
	 z14f8y1Oz4TUF5c+M79OQKXOUB+3FWlioCKs7SK8fKWCm0FjxrYTXLtaPcJ72fR3aiCNR
	 eYGoGoNGYGZv3UK/FzzLYygHuG9nEBAs1NKSxFEhIC/xMbjQ9blbiMYwcEBRy2G9Lois4
	 1He6iQjcLvIUsGT9REokArVlNv27yZ/K3+arVwCoFzFdD5zVFv0cm4hQX+0cAkFYRyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=n5EUOhoX;
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=none smtp.remote-ip=130.117.225.111
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B00F1F000FF
	for <tools@kernel.org>; Mon, 21 Sep 2026 18:34:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=n5EUOhoX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8B00F1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=Message-Id:Content-Type:MIME-Version:Subject:Date
	:From; bh=KgO+eNyCB8QuHZFTr4wiRIm8potuWTwjJr2H53yLmLw=; b=n5EUOhoXUzESzDDVAae
	ZDOMyPNofKgmKEdTirCNQ0/sheaMSMaq1YMCkfsFQugu53EJuK7tYv/shPdDQxuQxolVbIvdGimbV
	Hz07qAbjKqPttZhpsjU+kWEyni6Bi8YGGfnDHTluRa2nJqmyGUhcxha3shSXYCB6Fw3o/ZVECgJyZ
	BnoH9/Wg3akEw6ghWeDqSrsc0dFM5iZ+qVLCnnN3pr7sVt0M3Le5mVqHgVdTxqkNLgjLcGJvquVoO
	hSnmP/azmZ0zG7kpQXQhhd6pLnp3RHvVULBCs816yax7hvImt9q7y6C5ugQ4s4DxpHBX5mYJGUGfo
	u1sauL0yhxnOUeg==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.sw.ru)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1x8inK-007IeM-2s;
	Mon, 21 Sep 2026 20:34:04 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
Date: Mon, 21 Sep 2026 20:34:09 +0200
Subject: [PATCH b4] tui: map Textual's "auto" colour keyword to the Rich
 default
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-kh-auto-color-v1-1-8bb8fd7d8ecd@virtuozzo.com>
X-B4-Tracking: v=1; b=H4sIAKB4sWoC/yWMQQqDMBQFryJv3Q8xhoK9inRh4rd+LUYSIwXx7
 o26nIGZHZGDcMSr2BF4kyh+zlA+CrihnT9M0mWGVvqpal3SNFCbVk/Of32gypmKVaeMrTVyswT
 u5Xf9GliD9+1isiO79RzhOP4QoyqidQAAAA==
X-Change-ID: 20260921-kh-auto-color-3c43e0d04b92
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Konstantin Khorenko <khorenko@virtuozzo.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=khorenko@virtuozzo.com; h=from:subject:message-id;
 bh=NaN5ZVuyvy2qecxGIGfjCX31WPp4LoyFXYfet9cs4os=;
 b=owEBbQKS/ZANAwAKAVGWCkf5YVwqAcsmYgBqsXik7G0EOmy7VBbj0wDByNnRHto0qTyiIRDhh
 OLt7UkYC4GJAjMEAAEKAB0WIQRWD23IPcXT0GO9CCxRlgpH+WFcKgUCarF4pAAKCRBRlgpH+WFc
 KklsD/9tK5GE6sGSnpnzBXWYHDCr4Qak/WdfqPn2GX7dmI2qTsu16xjymTrLFcpGrHYoBFjY2VQ
 WUTIWC+VqFUdjKL4l0Ehsq2cVhTi9EuXc49Rn9aAxPYlzKVMirVNSuSf/m1HmqJ23sUQu6Em8kz
 osO2rJqj+u4xY1YYCg9dXTEJp1CMy4cslP2f6VEOYqJxBDMkjmbYfOuPzcWpn50CZoDRWbHmxp7
 LGtUH0H9mugUAQilP6Q7nWv7WIA/LIGo1wKAvaIA1SSbtSVP2JIuzqojCMZUHoZIz9kW8hrj7Gk
 QpDWbzzPML+Ibh/pYhK44LrCNuCw+L/DZ+WPIzXUtWFAkfV4/QEgcWDWJOP7dyBrgbhYVlOLuN6
 YJ+HM2Re8GubfW/I1IoH8nrI8wA5Z/RzRasI+76fy4WAA837bpJP0XUic/Xm0XfZmooCX8MR72w
 TBdN11f4aKh/YKJI+nrLcrHc74Xp+WpkFnxu4qei9lGMxk+5rQGVUafDstCp47Ct8CSaeBKCNne
 6Y7rroAbxhl0mymeX73iZdBvFLNSOE3i+OmVMEK6HMl3WJky2FMh27kqQfHvXSui5D6zkoN7wAw
 Mi2AQdpn4GY98Bm2XtddWMlLulf6R8YMxwMH4twK5QrpMUeaaOwcWLKctxH6Edvt9Ysm8hnqh5E
 mMzHjuZg+j5slzQ==
X-Developer-Key: i=khorenko@virtuozzo.com; a=openpgp;
 fpr=560F6DC83DC5D3D063BD082C51960A47F9615C2A

On every non-ansi theme Textual generates $text-muted as "auto 60%".
The alpha strip in _to_rich_color() reduces it to "auto", which Rich
rejects the same way it rejects "transparent":

  unable to parse 'auto' as color; 'auto' is not a valid color

Nothing reads ts['text-muted'] yet, so the crash is latent, but the
first consumer would trip it. "auto" asks for a readable foreground,
and the terminal default is the closest Rich equivalent, so fold it
into the existing guard.

Suggested-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Link: https://lore.kernel.org/tools/178950434999.53447.14781951874270825013.b4-ty@b4/
Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
Assisted-by: claude-fable-5-1
---
 src/b4/tui/_common.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index e85fdf2..cb2b4f4 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -257,17 +257,18 @@ def matches_limit(
     ``ansi_default`` maps to ``default``.
 
     Textual's ansi themes resolve ``$panel``/``$surface`` to the CSS
-    keyword ``transparent`` and can append an alpha percentage
-    (``default 50%``). Rich understands neither, and feeding one into a
-    style string raises ``MissingStyle``, so both are reduced to the
-    terminal default colour.
+    keyword ``transparent``, every theme resolves ``$text-muted`` to
+    ``auto``, and both can carry an alpha percentage (``default 50%``).
+    Rich understands none of these, and feeding one into a style string
+    raises ``MissingStyle``, so they are reduced to the terminal default
+    colour.
     """
     parts = textual_color.rsplit(' ', 1)
     if len(parts) == 2 and parts[1].endswith('%'):
         textual_color = parts[0]  # drop the alpha suffix
     if textual_color.startswith('ansi_'):
         return textual_color[5:]  # strip 'ansi_' prefix
-    if textual_color == 'transparent':
+    if textual_color in ('transparent', 'auto'):
         return 'default'
     return textual_color
 

---
base-commit: e5168b69c2b0661c7a167eff8ddc5753c458b1d1
change-id: 20260921-kh-auto-color-3c43e0d04b92

Best regards,
--  
Konstantin Khorenko <khorenko@virtuozzo.com>

