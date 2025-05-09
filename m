Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AC6272E6A
	for <tools@linux.kernel.org>; Fri,  9 May 2025 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778294; cv=none; b=IRcPdCaPLDQO3U2QWi0Fm08pFG91xTgG/emlxoeF2ySLay13Xrtut4bvcNpaTW1pZAZeBwfL1VJnyLBGO9lkfYRnHtYR/1Mf2V0tOgM98tTVtMQMsCLurFjlDYUEepQ/aopXy2hCZLDc6n5mzQjfX4SBhf1WTF2bgxqNXCXDyzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778294; c=relaxed/simple;
	bh=fo86l2DBKndu6L8fae8KDrox2SBMqJqTAjcf+OpGl0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZ/jIDwylJ3jRAgzkNwoyBNAhrg32Ll9BsiWt9yAWPI7MQgzL5quA/xP9SCXzoZrEXymLg5FJMnoWb8CuWOT6NH1rAZJ88LiQ05vY3m0YZu4Y/DFhtw6VP5hq8bN1ytmfECbrUf/Q8/uiySrKR9/voiW4QZ2M4E18rF2aTWD0mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rAnlRPh5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rAnlRPh5"
Received: by smtp.kernel.org (Postfix)
	id BEDADC4CEF5; Fri,  9 May 2025 08:11:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64067C4CEE9
	for <tools@kernel.org>; Fri,  9 May 2025 08:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64067C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso11238375e9.0
        for <tools@kernel.org>; Fri, 09 May 2025 01:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746778289; x=1747383089; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSMBXBhwDUb1i1AYuqCZlmp154Hgrx4SYfLbvJ3rQKU=;
        b=rAnlRPh5WCvsNIEodPjBGEjXmUHbFN0WWExh0W2RU8yjUYmgMVt+noLIxFSqFq+/ba
         pT4da+oWBXQo1nU1RQ7N2P00orVHbp/5xX/L4wf+tUTgVcDazhX/s9fKovVjHKZlzSSg
         IbJP/Q3LJk0XJUTyZ2dTBP+HLvucrfVfiLuA0resdAfMUM6uoU9wODFXTrt2GiVypfEg
         GsfT+vaVmhgRmtMPB5tD7ca+gfATuNEQSRYujIzESn7rGowTdfwDkerPrg4g3DlpmIGo
         HfixVHdHh1oWOmT8PFqyXtcIGn6WPFwwcd2wQdecGrPdlysIWKEYOx/Q6E48W0dd4NNt
         rfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778289; x=1747383089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSMBXBhwDUb1i1AYuqCZlmp154Hgrx4SYfLbvJ3rQKU=;
        b=IOkphl6jBtrwI+V16WdhJjPttaHeWlIQGxx2poaJLrkeeMENdRSE1DCeq9UxMuGYhF
         ksq8TYGw/8/VFM+GqeQZW4o68xImU3XhW2FzPjSUiLBgamJdI6Aq5bxPhS3Z/zoMorOO
         NGcsHM/MkEgnZwwLUVPzormlzU+x5TEXhDH8r7zIHlESC6oZMYGRuh710U9vUWcW2K3W
         hE4RX28rOWlX1h2slgIvLZxZQZ2sK1yQq+jQCkcLbM5I0LbMb5MjPtAn4DvZxCXnNELf
         LjR/DFuPxWxEdHZTnhx6qJ16c9EvWXnK7ss1s1Kq9TCBzSTCKXjVq+aei2lsqAAotgXp
         BANA==
X-Gm-Message-State: AOJu0YwvxWZMWk3lu2q82kkXKCJNFeDxk8kfGZg4o7XsFS52I0iQEvdx
	5WcA5q+RY4XAXUYfXa4+DXMOnmNTssUO/kDmpljz2gnl6vlwmIbgnC9Zv7cMON8=
X-Gm-Gg: ASbGncsPxSI5soIECB1WXkiZ69MoIx/fdGd+YmqjiMGn0ul3OVy8F0SAm3b67WSB59m
	YGl83Lpq4aQp1+N/JT++or5FBf7ZcBj8iNiSAUb1TAqF83KPgZC5DCVhCuOmsZBY8pueYwXHuqY
	Xg01bvcEfaWD66vNUCpiJNG/cEk3p+K8lHMnaKSA2UARdx1e5dtUETZD/ZGwGgbH9laeaEXct5v
	2eBIHKxslQv3Gr7XC3rF9fnZnbnm59buVvKOfeiUbpgCpwsdXhwxXVJu4J/4BHw2tozviqK0M2h
	ffkat1pm+ij13+MEnFPItKYNov0TIxMEjnUGaaYyGYdni5LfQ1jTf8isJGm+jU7Vw25idK1ioVu
	zLne8S+o=
X-Google-Smtp-Source: AGHT+IEzn9M5N/JWih1ig8XdHDxTFOmDW/Qr4hHUGKA4eKNbEGro+oX3r33TkiNgGjRDctR5TIrMog==
X-Received: by 2002:a05:600c:a44:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-442d6dc56a9mr14366575e9.20.1746778289580;
        Fri, 09 May 2025 01:11:29 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd3285f9sm64112325e9.8.2025.05.09.01.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:11:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 3/4] export-keyring: Default to store "clean" public keys
Date: Fri,  9 May 2025 10:11:01 +0200
Message-ID:  <20981e4678e8aac26eeb645ad4256c679a3c382a.1746774817.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746774817.git.u.kleine-koenig@baylibre.com>
References: <cover.1746774817.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fo86l2DBKndu6L8fae8KDrox2SBMqJqTAjcf+OpGl0A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoHbicwtnLNQfUeNA4AbeGIjwSdBOOyaANVPRuS 1iOQJ2MD72JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaB24nAAKCRCPgPtYfRL+ TvLFCACAzrBqlhmTOX5pd2pLte2/9GQqn3KZHd0Ske4wP2NJSyijsREEa38yadBSrNvR2T+e16y Hyc5zBNqh//W+Puf+ltY0R7sYFXVyYCui821l4VPTCczn8vCrE2LSM0wLw3DhhRfhyKb+eBzrlK kW7Y55OT3aB4CGn8L3eOyUePrHUO2v5XvOODvJAIHQ6YNZt3oRLXzYI5tvH0sdnwOYqY8DBKKNH bYxvncWQEJ+fJMveIj5SYsfHbaKOsKFlYzWPKJQhhicxu8Yyc+Q6sgmk3/lHo/CUNmhsYThy0UX iXWMN3bv6rPnCCxaOg8owxLVin98Y8lzTEYasMUm7X9lSgOp
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

There is no need to keep duplicated self signatures and signatures by keys
not in the keyring. The default behavior of gpg seems to have changed
regarding the first type of signatures as commit 671a0c921fe0 ("Periodic
update from keyservers") in the korg-pgpkeys repo introduced quite some of
these.

New key material is also only added cleaned, so it's consequent to also
let export-keyring clean the keys. A side effect is that signatures made by
deleted keys are dropped, too, but I consider that an upside.

A downside of this change however is that not only duplicated data is
dropped, but also 3rd-party signatures over SHA-1 hashes. While this is
good in general, this will considerably damage the Web of Trust in the
kernel keyring, disconnecting 483 keys from Linus POV.
---
 export-keyring.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/export-keyring.py b/export-keyring.py
index fc12624a42f6..fa35d7a381ae 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -51,7 +51,7 @@ if __name__ == '__main__':
     ap.add_argument('--graph-out-format', dest='graph_out_format', default='svg',
                     help='Export graphs in this format')
     ap.add_argument('--key-export-options', dest='key_export_options',
-                    default='export-attributes',
+                    default='export-attributes,export-clean',
                     help='The value to pass to gpg --export-options')
     ap.add_argument('--gen-b4-keyring', action='store_true', dest='gen_b4_keyring',
                     default=False,
-- 
2.47.2

