Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452DD528
	for <tools@linux.kernel.org>; Mon, 12 May 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039169; cv=none; b=CCSoc2XJXBQLsLo8+78qPWevfZmxuxqu3NwQ6/WF5qSQ4l2BtEgkam6gNAPJa9AkJpt0/SoDP75U/KiQahKZG4Vjubx9d2Nm3uEpIAfru6ZPSqn6gjMa+7XdLg/dZQtlijsJDSBsiPM+A0E3LLd8mDymP6tnVEjtHOdTxlc+Jjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039169; c=relaxed/simple;
	bh=oq2JU7K58rGgVYzC9AsZeDONvoOLKeB7qioexW30Tm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ALRLEJvhKaKmg4HT0fHnbnA57WkI8jPsA97BX7cE0yUGq7Y4UE0poqIxTIlMiz60zKYU/kbQZN1h9iXccIvk/3XjDCDQqDOyL82fh8WWi2ags4mKSoKbMbF7M6dX5Kc1H7pfF1jMWuCaIBbRbfeU9GVtXkOa0y1Cc8jkgfIy2k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Cq2rGRXF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Cq2rGRXF"
Received: by smtp.kernel.org (Postfix)
	id 9D420C4CEF0; Mon, 12 May 2025 08:39:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B49C8C4CEE9
	for <tools@kernel.org>; Mon, 12 May 2025 08:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B49C8C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so22967655e9.2
        for <tools@kernel.org>; Mon, 12 May 2025 01:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747039165; x=1747643965; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjZYLsvG4NSndxxlPp5geFehTo0ZbexgbH5yGUUzTEY=;
        b=Cq2rGRXFD8PsjoJzqRwHxOC3zJg30d7IDIRmqAqEGliJhRz7oNxTvk28VBc0K7v1FX
         kiPAgG3oM54TTbqtCixy9rO5nkmWAIe+NMMs5qoDowP7opF9FbEQUp0MczLZ4zPtNuiP
         AE0xGDDmCAiFgiQawv5gKmGAubLHzPzt3XuW4WU/FPu67YPBh2yk5v5HMy2ujeuStPIp
         dlLS/Axu5X1C5xe9kMZKDRMsiX28QFSceZCs9EQ3sJ2BwNQ9x2pjuZaJql6gvqXtummS
         F886YrHzFsTEnVyG2v6Er6JxRNMsmYBImBi0rmqxS05pxT2lvuZDBT8/yLvX+M9aoYCb
         n2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039165; x=1747643965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjZYLsvG4NSndxxlPp5geFehTo0ZbexgbH5yGUUzTEY=;
        b=bsupcIoelmlZmnFAXs0Ii58XnNWgYC9GpwzCVsCk/EOkYblwsvjDSTBjr5hZCWYUvb
         V6ZBF2rc/8QwpHdjuhrNUH9cAwlrI2G8JTaChcAkPxfOjQ3FoTRe6lGKrB069H6o8xnp
         ywjDIRgy7tYvm0jFDog/0FR0hUpt5N6Jy+0clKu/XfQpatKY+K1uj1iqVJlveZSNMwq8
         IhEJY0MD8pWrep9bRLOMPHgTnXB75fAr0KvSz44IrlB9RMzxSWKNzRY+3z1PR7FE/p8/
         P2yB9KE9sMqF/no9BiOcIVxgpJcltq5vKvWuW8ehWicx3/Yd6TPaVwxGq/JX9jDH7RVF
         zM8g==
X-Gm-Message-State: AOJu0YzRKsG12Zj8kzUtoP5qKeeLL0V5sgM9FJNpMQIDoGqYbXHTLmTs
	r5u9PdnA9666ZWltoSec1pnykGXTkPRosWOSUUIKGoVW51byLoQ4SkiNDV1IXQI=
X-Gm-Gg: ASbGncvORVzjJRQXk8wXR/ItTBG/Obb9j5CvJ7bp0i7ifmsTWSbRXrI50h8BSdNlawY
	qYJNTDILD8T1cq7z3rEF3cRizAW1tUzVagqHJxBBAJ5JESmtH4e2MbACF+dBSLxR1tM1f319OH2
	mASETdQXlpkEcTKBmyrH6dPJVrrhT6JrQAs6oh1yMfF/ROsnHfcNeoWhQRZzHuDE1HCe+tQJt3y
	ttY2VO/H1oJo9OY1WmxuJX3scWbr5z1EDejnri5EtXG7/CmlPND+maMDuPER7L6cEgpR2uljhbo
	229B3nPaBO15PS8p3Mm9l0beDjK2LRQ3kzpIdcjitWi77uwa/yFRdvQt7cBrNSNNmkKQAGVuJFi
	w6HGqaTvbjfBytcLsvA==
X-Google-Smtp-Source: AGHT+IEBm3YDt5m+f1+tf1FvtqjzFcZKkRZmVCHyXn7ViMc0rTm+6jDqj6zzFMUR+HtCU6IW9cpkMg==
X-Received: by 2002:a05:600c:3e8e:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-442d6d37b08mr105075805e9.8.1747039164934;
        Mon, 12 May 2025 01:39:24 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d6858579sm117059485e9.28.2025.05.12.01.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:39:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v3 0/4] Updates to wotmate, partly due to changed behaviour in gpg
Date: Mon, 12 May 2025 10:39:03 +0200
Message-ID: <cover.1747038870.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=oq2JU7K58rGgVYzC9AsZeDONvoOLKeB7qioexW30Tm4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoIbOm/mufkTSSOn4WjM8P90xb7Yeu92IiMl4gR qeM6XlyAHqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCGzpgAKCRCPgPtYfRL+ TvHGCACgBCxlNsHuvWXssm+sK6ESUfsUWRT0DkZPvR+cx8PGaeontYz5PAqIF1DpVNeixnvjs+r L5swQiYpUcJ71WVrvt3iO0LR1zfcuLdGNJG7OFJU/tt/VTb5ehHNtIlXpSnHgzfq/cYz+1/1pCR 5JF5+sPyRH7T74di1NsMs5gf9uzGC/K4vSQiqrGB2Wf+3yF1Cwhu9v568nuXNECeSl2XPqhkq2n 35Cast0YW7LWHWN+n4Y7zD2Jrt9Lh+31yKvhqlPbjkaVT/JkdPhwqyOqoRSC/bkuAat0emlK8h8 XD00MLlY5/eAiCDgzCs6q2UcuExMYf4YLOVqS2Eh7iaplm22
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

there is only a single change since v2
(https://lore.kernel.org/tools/cover.1746774817.git.u.kleine-koenig@baylibre.com):
The comparison between old and new txt representation of the trust path
was using

	if key_paths_repr not in old_key_paths_repr:
	    trust_changed = True

however that failed to detect a trust change if key_paths_repr became
empty (or in general: smaller). Considering that in patches #3 and #4
quite some trust paths are ripped, this is a relevant change.

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

