Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64377283FE5
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489720; cv=none; b=Oo1A9twWr0beEz15hbzRL2UP9IP8jOy/t+MYf5kEO5LsFhgJ7vl8dV5liGvZIdh4Eeigr2/ZGXnbShNosGUhcWmow2+uLydxYLcBbm5H6ABEFqME0O/ivGYA/4G0Sg/PgkCzilTNLEJ8sVEqmr6VQish5JWPtakiL7zFwskuMfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489720; c=relaxed/simple;
	bh=5tlcttyM1zc/NJ+NJbK6GlIX4o/aTBEBwVX7q3h9J+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+mfYhB5dMWrXTOepEllhuq+dkBuo3PWhFdePq7KHPe/zrKafHL4GJ0CDANhs9+g87WtevzOcgVjhbUGUEWiqROJTf6zJQh18YFNnSebVUWDdP4X19h68XaIg6/ms/pLopjwcBlkefniirjdyAMywFUDTX/EZ2qRvqmDfHSHKKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9f0aX11; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9f0aX11"
Received: by smtp.kernel.org (Postfix)
	id 628FA1F00A3A; Fri, 31 Jul 2026 09:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9558C1F000E9;
	Fri, 31 Jul 2026 09:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489719;
	bh=S72avlIexJaC9MMAemQLQHw9o4Ov4UU4/cknPdLrqsc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O9f0aX11EHlHi6HK593Ds4ZFwLCcsjfna0tqAs+17rCVJvy0QTPng9HIdidp062zT
	 hapYIzRTWbPoumbe1haIWLQBRxihOcmWFNNq6mt8XR6jOsjuy0mEBvavn58BHbIfnT
	 RQ1iXRIk23bBo8eKyUzMnWb17+5Esrdip/oKRpvmTR3RPPRgLKrqLFWTlAXlp4T3Gf
	 ACJopmx5UqHfBOVcf5m2DEjrjoUhw7EhTlqa0/PKQuEExCGaSrGrnLYr6SbJL8nn8Q
	 BF200m9Cx9XeAgz9344eGXG1WDKgSuG/5y8PNfjp4gg/wlhct1S1lKBoLriy9zD6Hd
	 J5UIGFCETEGjg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:26 +0200
Subject: [PATCH b4 27/27] review: close the tracking database when
 archiving fails
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-27-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287; i=brauner@kernel.org;
 h=from:subject:message-id; bh=5tlcttyM1zc/NJ+NJbK6GlIX4o/aTBEBwVX7q3h9J+o=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIp1dL7jYhRxWGAdpjz7vlzHhzwGDueJOmsyHIyvT
 L8nF5zZUcrCIMbFICumyOLQbhIut5ynYrNRpgbMHFYmkCEMXJwCMJFVKxn+x5g/8bp8xCP9V4TZ
 8p6j2i8/X7c8MEvjsbvpFifpqdI/TzEy/LP2OFdsoPurZFe2/rOwfPeZTrdzfwgsSNw16fKbmAQ
 fDgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Same thing the auto-mark block had a few patches ago: the connection is
closed in the last statement of the try, so a failing update_series_status()
skips the close and leaks it. The tracking UI archives from a process that
stays around for the rest of the session.

Close it in a finally instead.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 4c67387..fb308bd 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -875,14 +875,17 @@ def archive_series(
             return False, err
 
     # Update tracking database
+    conn = None
     try:
         conn = b4.review.tracking.get_db(identifier)
         b4.review.tracking.update_series_status(
             conn, change_id, 'archived', revision=revision
         )
-        conn.close()
     except Exception as ex:
         return False, f'DB error: {ex}'
+    finally:
+        if conn is not None:
+            conn.close()
 
     # Mark as archived in Patchwork.  The local archive is already done and
     # cannot be retried, so a Patchwork hiccup is a warning, not a failure.

-- 
2.53.0

