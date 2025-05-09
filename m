Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C8626A0E7
	for <tools@linux.kernel.org>; Fri,  9 May 2025 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778289; cv=none; b=MXjrQMYSxg3EzKZOLoo26yHMqTSjEtBzrC51SRtFBO47lOlMe9rTVvKXNr+QW81SrHP9yv5fVAL0l8MDGL1hHTDsn5UwNzrcusJvDXHgPrFhqYZRQi2eOQJbREZCmENQpXNiiQPhXHuR7OnEtphomqYN07fjyPtd0o1TTIWNW2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778289; c=relaxed/simple;
	bh=156c+d4hFSVBUcHDMyD8SvrJ0ZXo3Bo9djui6ITc6zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O6N61LiZp1tChpOV0lxVQwkDtWBoVccgDb8QjeS7mCyPcxjn9eAo1PBAJaXG+V/7OXNW+TcFc6OfLcNsUPIB5s9GCv6Wzu3O1IaWJn4gYnuDcBmREJQ+SndL1I37dzGgwF2MAcjdsXgnR1FRDSNz/RIfzZNx62kTpHslnZZ6RUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kVQlWveO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kVQlWveO"
Received: by smtp.kernel.org (Postfix)
	id CA99DC4CEED; Fri,  9 May 2025 08:11:28 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9619C4CEE4
	for <tools@kernel.org>; Fri,  9 May 2025 08:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9619C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a064a3e143so994534f8f.3
        for <tools@kernel.org>; Fri, 09 May 2025 01:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746778285; x=1747383085; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nU7d3cLfISZCDmzIi7fw7ioQvbpBTK03WM7I8V5j+4=;
        b=kVQlWveO+fbzfuN+SmZ5sqWPD3FRzcX/mIviKsTZSF0LOsAIsFRnltv7bRMXXypSat
         AfqScRf1er2W3cX/BJbXL5cQsG/zQeC+Jrok6GyHH+PEFDUNCkbgyvNHIDwHgSz/l7/q
         SCfOPyXMMRwLcgDqybYzMy8XN4bNN9ui3pYWj2eGwG5M6MkOmM1rBDmeL1eG6M8iyj+u
         cOCqshgXK/ymu+WCP5vYhZ/F9IhoJE78KU9fpg/OWMQ86QmSNNaGBdGNfcoQ9RyeSgSQ
         fMMYLsHRbP9o4BbchsBl7MdYJm4wZdSxp7Q0xQuAEblMlpgzVMYfDgUGCHk7yvzXqfjz
         2Rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778285; x=1747383085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nU7d3cLfISZCDmzIi7fw7ioQvbpBTK03WM7I8V5j+4=;
        b=N87BQnGLb7f4hTaE15rN7+N9YvuCDZ0+ThCrmxkAAE1w+aGHxn7dOm/qFPmCqGnZDy
         YWcy4ObUZSIUC2OLhJQajXJbCoR387xxHA5+cjK5zClWxXk6q0+opmdxJommne9PzbCr
         nMPSIjO9qcYmABopb60JisuN1QULGPoMMT3UBnLXsPQlXnE3t/m5UJUURjy0zTxFhIox
         OpaLWq9QyKiAS9BO0u+00IZo+ZpetsVP+09OE37pv6HMlTaN1hVrAhlPzvqBk+K7UQQ7
         McB/ojfZXuHEP3kxgWwKBtaq5aTpUkI5AiFXjR+cs+Vl9NafyfO0DHbqJaYIuvaRQKp0
         vZKQ==
X-Gm-Message-State: AOJu0Yz0ZBl99BdTndbfaazwJY6II8+DBXMYSQJHrVbu30SiTmO+ucbJ
	7JQ8c2AIpIrwZVEfMz3B+b9s+M3jAIZatuaBSXgkZ3EDo6iYE2l7VY+akyOI5gp2hkwIE7cwCDb
	V
X-Gm-Gg: ASbGncvqUNkczhvUra2x/3+dEwB6NuZ3CSqjacHaZGIopmDM0cWQjFkBiFl8NqjOwa1
	DICNIRPri6TvoO+Oz7+bgWEJehi2leElTn7qNcQDFOW8Fv9wyULBJoX3YDe2rQh+v1/ozmKc+E0
	ei8sPXDMd2Szvyl3Pusa+TthZAsRYUfnSsWKA5ja1SxPaVDGQptxylw5oMraAgzx4HOAkiGCfQ2
	F65iT8G1DjodULStUBpUVoGG9T8/jewkJi5q5gwytAuqu0171QTzSlK9nDeF7RMxV0WEdT/psZR
	jy+YByaGRgYLHpDlf47KAmDerHb1cel0XZkCFNPQYw/RECMFpt58jU91oPeEFqBAfTQ8ahw4JbL
	M+YOEiJE=
X-Google-Smtp-Source: AGHT+IF5XHNr1mWwK21MWAkBLW8AU+07YerX29lgw/IRbHs9lyHhieggxU4U8pLB4h0rusw7OjcSOg==
X-Received: by 2002:a5d:64cd:0:b0:39e:e259:91fd with SMTP id ffacd0b85a97d-3a1f643113fmr2095170f8f.17.1746778284735;
        Fri, 09 May 2025 01:11:24 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f579aa5bsm2472566f8f.0.2025.05.09.01.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:11:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 0/4] Updates to wotmate, partly due to changed behaviour in gpg
Date: Fri,  9 May 2025 10:10:58 +0200
Message-ID: <cover.1746774817.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3032; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=156c+d4hFSVBUcHDMyD8SvrJ0ZXo3Bo9djui6ITc6zk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoHbiT2kBF0E5RcH2vL0/xnQITRbkpsLH0MoVEO c/P+VC6uLOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaB24kwAKCRCPgPtYfRL+ TooPB/9IBcUKG9uAcehYkdwSPGw70p77OaaWK8RoL9LfvmoTu6DS2+vFgVzyBdrREDK4hJe9ONz aS8UA6pZkiStst2u972MvrsLJosb7q0ukJmJelyG4RamQb38amEzJdb+9GucvbUXbh9Oj6qUIai O4/iyhJYZGufhBmHYH/YOeU0yFGmP3PMlJMQeehgvxHhoaWnv2OQCSjH+msnMcobdNoHlHagD1N dHti02VT43BjJUmewkbvlwkWLPdWEwyUfkR+gHAlLWXtv04h6UccxfkKva0Ndtdm3Kr2mWOm8Ha meXTqfOMom5ahFRPni+D2hux//TmkWOKkGsSemXr8y6AsDK9
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

here comes v2 of the series previously posted at
https://lore.kernel.org/tools/20250508094451.762484-5-u.kleine-koenig@baylibre.com/

The effect of the first patch is that changes in the trust paths are
easier to review and also that changes are correctly propagated. So if
there is a trust path

	Linus -> A -> B -> C -> D

and a signature A -> C is added, this is then also reflected in the
trust graph of D.

Certificates can lose their trust path from Linus over time, e.g.
because keys on the path expire or are revoked. Currently export-keyring
stops updating these keys. However for keys that are already included in
the keyring, it's sensible to keep updating despite being disconnected.
This is addressed by patch #2. As of now this only affects 2
certificates, but with patch #3 or #4 applied it affects 485!

Patches #3 and #4 are similar in spirit. They result in wotmate follow
GnuPG's policy to not trust SHA-1 3rd-party signatures any more.
The effect on the Web of Trust is considerable:

 - Among the 602 valid keys currently tracked, 2 are not transitively
   trusted by Linus' key, without SHA-1 there are 485.

 - The size of the strong set is reduced from 359 certificates to 96
   without SHA-1. At the same time the diameter of the strong set
   increases from 9 to 16.

This can be softened a bit by importing 3rd-party signatures from
keyserver.ubuntu.com. On the updated keyring the statistic becomes:

 - Among the 603 valid keys currently tracked, 6 are not transitively
   trusted by Linus' key, without SHA-1 there are 485

 - strong set size reduces from 431 to 180 (affecting 2 people from the
   current strong set), the diameter still increases to 16.

Some more data can be read on
https://blog.kleine-koenig.org/ukl/the-linux-kernels-pgp-web-of-trust.html

Changes since v1 are:

 - Drop an unintended change from patch #1. The change is good in
   general and now is included as patch #4.

 - Add a note to patch #3 about the effect on the kernel keyring.

@Konstantin: IMHO patches #1 and #2 are ready to go in. I'm unsure about
#3 and #4. While they are conceptually the right thing to do, the impact
might be too big for now? On the other hand I think (and didn't
check/test) Linus cannot verify a signature made by Greg without a
warning with a recent gpg already now, so getting rid of SHA-1 can be
considered to just match reality.

Best regards
Uwe

Uwe Kleine-König (4):
  Put a representation of the trust path in a txt file
  export-keyring: Continue updating keys that lost all their trust paths
  export-keyring: Default to store "clean" public keys
  make-sqlitedb: Don't consider SHA-1 signatures for trust paths

 export-keyring.py | 156 +++++++++++++++++++++++++++++-----------------
 make-sqlitedb.py  |   5 ++
 2 files changed, 105 insertions(+), 56 deletions(-)

base-commit: f146a1815ad93b2f318e0a5fa857b11814a78b8b
prerequisite-patch-id: 4b7e0866c7adc0d84eef602013fbe0fcab86b9e6
-- 
2.47.2

