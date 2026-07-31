Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18737DE83
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535172; cv=none; b=SwuY2VER+9iswEyZU57D/H9tP35c6N/6T4eyWvTsSr3+T8JG1hhOvskfxDM76ruR4CI77SFIX8HDCTUxX9m4l89Fuvit9gncoHKUiznSY+r9REBsKpOIyOlkrr8DNGDyw2GXAzoFb7M0/JEX4NdtWz4gK3LgVqOjZEJN87gTZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535172; c=relaxed/simple;
	bh=SEQblQIi6qbGMAspcd8DQcl4B82ai2Mva4N2S/LVqUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a3a8h9ogpzKquoBsJxKVhXV634yYu9r4HuUcktF3u5QGa96Y6WFxm52YPAkoYn3dEDG3aH3qBgSi7hSQ7CDkh02UBW3eQBrF+Bo8qDamS3MH1r5Y3F4bBg4HQHgmPsOJVq4ngIOexa5wHgpUtVmDp7kFm4+hK9YnGf6DMGK3Mc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlXx/dF2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlXx/dF2"
Received: by smtp.kernel.org (Postfix)
	id 272B31F00ACF; Fri, 31 Jul 2026 21:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594471F00AC4;
	Fri, 31 Jul 2026 21:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535171;
	bh=ttQ9C/3Cc/fWf6jbWR2o6pRKDUPINryAdUdy67M/zDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IlXx/dF2st/la+fAmhuFkysnONU7EMZ8GmWeIfjZ1h8TsNtq3I2rsvoED23YVplDZ
	 yPABSDF+5iXPCE2sYflqhNcUye9yhhR1TFuoW/qn9WBfJW97aFgD9TRGeNG1qm1hiR
	 tgLheZFdlASdHRVeiYUEsS64AjS91BZucTt6+Rf9slOyQMuZDVxp2kFFlTMOhPAwQR
	 51/yPBO0iEFdbyYR9LsLGioO0HB446D9U7ub5DBPyIDJD16n80FXgFv8zFSoTh5AIK
	 rY/X06oR40FWApxdaDcoEaDim4YE7lXSnkTVuwsKEfZdPZnP+X1a/kRs3rKcT48CO1
	 VlTqJg9KnNdTQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:12 +0200
Subject: [PATCH b4 v2 31/44] review: close the tracking database when
 archiving fails
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-31-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=brauner@kernel.org;
 h=from:subject:message-id; bh=SEQblQIi6qbGMAspcd8DQcl4B82ai2Mva4N2S/LVqUo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs15+D+e+9eiN4t1WkLb/0S/UjNRPc/H3mnyXrhhT
 aOZ865pHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABNZ8IDhv6ugkpKj4FKlmoU5
 p/PFejZpeZZN9A9heXTz1F+v9KwDfxkZJtZNNdaLmfHWVjuw80VL94ddy+Z8XtxiocOy7mAr9+w
 l7AA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Same leak as the auto-mark block: the connection is closed in the last
statement of the try, so a raising update_series_status() skips the
close. Close it in a finally.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 06595fa..c3aa8e9 100644
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

