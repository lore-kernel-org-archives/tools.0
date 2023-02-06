Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259315CAD
	for <tools@linux.kernel.org>; Mon,  6 Feb 2023 18:23:35 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso9540748wms.4
        for <tools@linux.kernel.org>; Mon, 06 Feb 2023 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyVQ6P/zy9x6/WZlI9Xjyl3p7wAzLgocN7VrMRc1Erw=;
        b=p7WoWDH29G2AwaqxEfjUAQ78yeVq7f/iq42/9/cmiI5eTzRUZtlBSLtMcEimmpjfgr
         /t4QCj02c1W05FIX0WM0L5Vn1ejP30ZhucN5rFmq0Vqo9iRBA44huk7p6ggM62XuAaAG
         rTgDzK0cwxBZMUN83GipraGZLIbRYhYtUfB4NCDd9irAWAxdHvKzQbK6ILwxLmKSW4zX
         oq0DYewPQarDZzzRU/4QXbUypXuTk5+MxHZhYn3rrq5bAPYWTkXg2oOAoobKMtrTguYT
         JtB9nUA/z7kKo5+QmdxY3nlWjNc0A2oKtRdZcW6z5z0W2ZHRrovQrJNdJFGdilNAJkkR
         5nSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyVQ6P/zy9x6/WZlI9Xjyl3p7wAzLgocN7VrMRc1Erw=;
        b=TJeV1sWBcgjMR9PIl56WxDmgKqQuveR9LtxYuSkM4/BWx7a6/VOnEKdj0186N/dEO1
         2+T/RM4B6xk7oOb0/p0econtpHGomsWIAYb/60bTMV+R+StL5xgxIO5DYX+egt3DBvM0
         OD1n3/PYZePMZ6VXXQyEEkHY0gvHqir/ixr6I21cTdPj6bSk9S68hSqaf58dcvyC1Ukq
         0ao2ikPZj6YTEt3C5JzSx4BuoINRf0Um/50sqzUyMIK6fjpFJel/uWHTRg/e2nWajWZf
         HOBahtQkADaFX61z51k6dO/bZX4LYpxTUTBp9OY/EOVl7qz4kSCzB1+6S9Nf3hjzy63y
         zGiw==
X-Gm-Message-State: AO0yUKUl6HackY8w+ZLSXZFnlrLSAeDzpgxFaTG9txyR9B4BljFho/iT
	pgv4TYKeWHNaZu84NQngobQE6wPVLUJSi5zZ6UA=
X-Google-Smtp-Source: AK7set+JZfaareR0tJTXnIb3UUUsWE953v/h7HagypXLRDMsTPEVnHAurSaCnm2D2ZgilgtctO+PNQ==
X-Received: by 2002:a05:600c:996:b0:3df:f85a:4724 with SMTP id w22-20020a05600c099600b003dff85a4724mr554814wmp.39.1675707814025;
        Mon, 06 Feb 2023 10:23:34 -0800 (PST)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm12871588wmc.4.2023.02.06.10.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 10:23:33 -0800 (PST)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Mon, 06 Feb 2023 19:23:04 +0100
Subject: [PATCH b4 RFC 3/3] ez: prep -n: validate fork-point is a branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-b4-prep-fork-point-as-base-branch-v1-3-2732e0c32f5d@tessares.net>
References: <20230206-b4-prep-fork-point-as-base-branch-v1-0-2732e0c32f5d@tessares.net>
In-Reply-To: <20230206-b4-prep-fork-point-as-base-branch-v1-0-2732e0c32f5d@tessares.net>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=955;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=/uDrGGCjin05he/6501aK4RlIxHWv42iVskhR6R68lI=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBj4UWi4LyHxKjG847OfiO/wr376Qj3hHes4ID1t
 P8cwcGlzLGJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCY+FFogAKCRD2t4JPQmmg
 cyraD/4ogLof4aouWJ5mTeOEk7c98Cicrmr9N+6Y1eLSRxpSXnhmbrPNZkYYHKEf5gMakEFP0qH
 HmzORLO8vwP4+7HlPB+PUV0GAahwqTWWjXdxM81cREvgFGVa7POgQ7Q6cbkZ6d6QncyW7KRM2ZK
 uitY6HNOtjov1GFEeIm9WWxuhAlSxWc19gHhODnj7CxvH1hrgszn/12TLF2Wm0GzvT5wJtngdEu
 gHxyHpggjohrpRGiXvRaAumsWC4ga5ltxy1Jz+UTkDYWMn1GB1A/VctYO9CFrYT+rKfxInYY6x1
 EpWnqIZ7wV6lQI91PKxyTLyFqmsEXScuBPgkbSFMFM2k3ggH50ooDrrhdnM79LSTDCwyBIOkkNf
 eRnbjBS7lG5LGvixb5eLnrMADHI7f75UDKFNhHZfCBaN3pj0+SFDUVyPY3omJHlisG5JWAlrwh0
 jYvUyZjvx/gx8zD8Z9D9gGIjofUZowRQ+S5U5uhxiEBfwdQlxfjlYzQoQ4SZDf420DZhazZbdpj
 40F+LuQBjdUThQlP8W5n4+XH4TGd3M50lolSS0pfafl/V4jXPpP/azkDfDv0ejggiCWSa689cBS
 C2DghAQYq4tn+yXS4o0J8JR68beU3ZPELDhbDgYy/IlInv3AawkD2hplEn+m1V9KGnrxNxWmP3X
 xvPHaLVlnH0UmsA==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

This --fork-point option is used to set the new base branch.

Make then sure it is one and not a fixed SHA.

Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 b4/ez.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/b4/ez.py b/b4/ez.py
index 9200d03..8d90296 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -330,6 +330,12 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         else:
             basebranch = cmdargs.fork_point
 
+            gitargs = ['show-ref', '--quiet', basebranch]
+            ecode, out = b4.git_run_command(None, gitargs)
+            if ecode > 0:
+                logger.critical('CRITICAL: fork-point %s is not a branch', basebranch)
+                sys.exit(1)
+
         slug = re.sub(r'\W+', '-', cmdargs.new_series_name).strip('-').lower()
         branchname = 'b4/%s' % slug
         args = ['checkout', '-b', branchname, cmdargs.fork_point]

-- 
2.38.1

