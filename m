Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483D230264
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 01:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776648264; cv=none; b=VfjsreK4DejuvK+lgpUQwAUFaZE83TjoBv/9vhexQVZPCrJTI1WRdlTpSJONMr/Q4ZSnO06zfsGHPTNpPiw8VWB2Ml57KGZHuYSkGdDSlA0h43tDc5XWdRI2J1mISRNbs8OylytwAmCYDpwdiCCL1jiIcu/Wv2MUkvU7pC8b9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776648264; c=relaxed/simple;
	bh=X5LwRB8RH4FjbgMkkR16+L5qboaWJVPrD8dfr1aQWWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aejASeSAY2+piotk0uPetEWNnxDzFAQqwCfArE+7IR5D3KrEQqm+dW2xVtPffNKLLWHVRGVHMzCbH6Nfz9DqZeu9RO8NCMFeLwxrffrfAtUZSrj5PPP8tKIiWzx4BEgpl5VPsEBNIKteHSDKxgXs9CZ2l2jFdpxT6uioQ5jRttQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qt8E1cgE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qt8E1cgE"
Received: by smtp.kernel.org (Postfix)
	id E6B3FC2BCB5; Mon, 20 Apr 2026 01:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C01C2BCAF;
	Mon, 20 Apr 2026 01:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776648263;
	bh=X5LwRB8RH4FjbgMkkR16+L5qboaWJVPrD8dfr1aQWWo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qt8E1cgEqE8jHO649+thjCUmb3Mu4+2+CV6UaUa+O1MsUPhl+5OD6+FeIyGrAZgFC
	 iTzoTkFojEndkYp5FxEOC2Xpc9tqN71m3VU7elceiJ0NjXyHZOn9zbptlb5/z5KQjO
	 5MAMta2oUpjS9HCKG8mOQccHWScjj++xeObyxcDwK1tAMObLlF/FdohvtTLE628Yhc
	 JvXhudeH8ZDCPGMRg0FR6G85y8RC0Gpuk0pA3ttekQbR5jCH9dIeVXymaEXyBRfOcv
	 GXX/Cf/6lQpguk9Akj4nFUrXQhwOLgL2rLU/L/wIMa5tCPqFhRhk7kV8c5ygoGqp+t
	 jZZkzBTscSkiA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:22:26 -0400
Subject: [PATCH patatt 6/7] Reduce dictionary lookups
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-6-5c108048d2c7@kernel.org>
References: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136; i=tamird@kernel.org;
 h=from:subject:message-id; bh=X5LwRB8RH4FjbgMkkR16+L5qboaWJVPrD8dfr1aQWWo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP65+65Z79bvVxjpFdxe6O4yx1zuINpmlSd68/7Q43m
 /3pTH1Nx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKkWY2JkmP/L5u6d0O271c6sfFyov//KYrndeb/tZ3cbrvB4Y7hQ/gQjw7P1e9N
 KOnS4NSOKGj9Wx9pUHVWY/CTS0/CW+ocfu4qmsgEA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Use `dict.get` instead of separately `in` checks and lookups.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 src/patatt/__init__.py | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 7087479..b20074a 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -1024,8 +1024,8 @@ def get_data_dir() -> Path:
     Returns:
         Path to $XDG_DATA_HOME/patatt or ~/.local/share/patatt.
     """
-    if 'XDG_DATA_HOME' in os.environ:
-        datahome = Path(os.environ['XDG_DATA_HOME'])
+    if (xdg_data_home := os.environ.get('XDG_DATA_HOME')) is not None:
+        datahome = Path(xdg_data_home)
     else:
         datahome = Path.home() / '.local' / 'share'
     datadir = datahome / 'patatt'
@@ -1100,16 +1100,13 @@ def get_config_from_git(
                 continue
 
             if cfgkey in multivals:
-                if cfgkey not in gitconfig:
-                    values: List[str] = list()
+                cfgvalue = gitconfig.setdefault(cfgkey, list())
+                if isinstance(cfgvalue, str):
+                    values = [cfgvalue]
+                    gitconfig[cfgkey] = values
                 else:
-                    cfgvalue = gitconfig[cfgkey]
-                    if isinstance(cfgvalue, str):
-                        values = [cfgvalue]
-                    else:
-                        values = cfgvalue
+                    values = cfgvalue
                 values.append(value)
-                gitconfig[cfgkey] = values
             else:
                 gitconfig[cfgkey] = value
         except ValueError:
@@ -1423,8 +1420,8 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
             'Identity must be a string, got %s' % type(identity).__name__
         )
 
-    if identity in KEYCACHE:
-        algo, keydata = KEYCACHE[identity]
+    if (t := KEYCACHE.get(identity)) is not None:
+        algo, keydata = t
         return algo, keydata
 
     if not config.get('signingkey'):

-- 
2.53.0

