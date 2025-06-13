Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67820E30F
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 16:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831557; cv=none; b=f8u0H9ydJ33NUzZAp3bglitPZXV5I3bocoV28IRJ1ACkHTitWfCsXiVT/L6IfqIMMjEFZNUIh/slfXvuJA1c0RpixeX5lnWpjyEasM2lQsb+Yx2p9IbZbQQvgHs3+ywoZaaoGcamWFFl6A7VQqD9aHSBum3AtPCyQ3YXIl0AY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831557; c=relaxed/simple;
	bh=6Gd5ltXFWCW6b9IaQlFuHwYZAcE64q8v20nrBRHYVAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H3apj6Muuvu9sqwuSNkt969oYnMOIQ2Fdjd1drA0N5hyymKZKZUCUd0k8fpZv/J7Ur8IWNee7pcj3tWyuMmffkctfh4sA11xYHPtSopA9/a94gMp5NA7smtwXjHEGSugNzgHb/LNyiPpaCxr00synGCWQj4LmiLIptXf6PX0FK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iwviLY2l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iwviLY2l"
Received: by smtp.kernel.org (Postfix)
	id 18973C4CEF1; Fri, 13 Jun 2025 16:19:16 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7C05C4CEE3
	for <tools@kernel.org>; Fri, 13 Jun 2025 16:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7C05C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso4290527a12.2
        for <tools@kernel.org>; Fri, 13 Jun 2025 09:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749831552; x=1750436352; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3pNHzOFG8lQCI+k3hDHfQk/GKXipqPQ7jIxGYZHGaSE=;
        b=iwviLY2lLMO6OZTOfLF6oF26Rb5NpVS2jsCuznQgXPH/QuPbeof2kzyT0HLc6lhB3F
         VoiXVIrn9Ai9m3gbSAg9cADnKd8E2GiMHdLTAGqAm5wNYvztlgs/gD1heAH6SR7Ado8X
         2ClvrTZSwreQ8SWNCQQSDSRwxGndInvIMjO0xkq9OQJ7P2mICqKmVp2O96Mg+XA+SyCF
         ZELkfB1YPw1tl1che9383i7yJ3qDtbNQ5vR35VQ9W2EC/W6Z1BwB4Onn4dTsD6lqLmgu
         hexqMnoYX/BsYaPAW2NeMjuWDnxzzrNDQkCvMyFlQFMOmPZpgIzZRUmC0Qe5cRDcr89q
         p2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831552; x=1750436352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pNHzOFG8lQCI+k3hDHfQk/GKXipqPQ7jIxGYZHGaSE=;
        b=DEQdPyWf7ZIXVGm+7G0QWA998rHGV59HgZw4TaN+lxOJLHKklaAl3+B7PR+chk0vpa
         /6E/rXy/OLLvFfj/7DElmUgMhIGZb4Y/UQ9iwAwQPUnzFhHuVvXa0jM3Orhltsr1kRzo
         W1pI/fDyqID0SeY3NwIAfPexv8gbXu4zD8yYu8AzpddGmQsB/TbEhIZ6UfyQcTFChgDR
         f05hXHPjgHyKLhuTTX3/aO8owVrOCREpG8vTN3B9xPjLcYYPymK9PL7GmVa39uPcNs9b
         tZb8PZKTpnYozmaj2Iy+5ulgZIT2sXYBm/MWM6ZAB87Nj6tMOOPI5iY2SOml0DUnesEm
         IhFw==
X-Gm-Message-State: AOJu0Yys37P05V/QLN8oI0fBYVh0qaijA7LntvhNW6a6BHjG7KpE3brS
	1xXpECzCqatQQvoM0Ie96+ajDshAJyQ4rKudgAFRR19rAAOQrMpVBzvtT4QNyehhYhY=
X-Gm-Gg: ASbGncsrU7Z1KxFDLz4kVaPJKCLm0kwz1VxUbxYZX0GQY1pdl69dLA4erZZFkWx9Euw
	bnsx07MsfwtFHvWoNzinaOMLf+ulh8rGM4zqLjwWgW1BwFXH1HjRSqEweZGT4tYubkAkMKkZdmZ
	3Atf+RuOpKKh0umFUi9uIO9ZSRmlH1ZZAzTlKiAWKH43e680rZwjo91ewF7HyILsbvoRd5Xayu9
	MCJhtecdnaYm+0PPqO4W/+QqaYNQ7CFKRMbnS7/r5hxY8NgvWSrTR27lCb9FrHuieef+GaynWgH
	HvWO0z6mkn7/ZcLx2nZnIgOWsKtk7cYxk7jtY6QEh/GXHrMBDtCeKxcfrGttKeqJfRo=
X-Google-Smtp-Source: AGHT+IFjQ3PLDjDqvdIxkd4So1sMN5KzSAXtHScm+q8wg4ohKHs5CiL+c1a1CUz2ttO5uriir1WMMA==
X-Received: by 2002:a05:6402:1d4c:b0:606:f836:c657 with SMTP id 4fb4d7f45d1cf-608b4a57731mr3121168a12.28.1749831552043;
        Fri, 13 Jun 2025 09:19:12 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-608b48a876asm1393952a12.4.2025.06.13.09.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:19:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 0/4] A random collection of patches to export-keyring
Date: Fri, 13 Jun 2025 18:18:55 +0200
Message-ID: <cover.1749831371.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=775; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6Gd5ltXFWCW6b9IaQlFuHwYZAcE64q8v20nrBRHYVAg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoTE9uPLssgg6tXYz8HiBD0oJOyA0+xQOUHs+NS LVEH3PaUGWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaExPbgAKCRCPgPtYfRL+ Tj1tB/9OeBO0vuSOMuDFjfSJ0cprPEOhl4H1LkZoEKde6Gvy9RZFJIySxyj3J3KbOZhx+QS2q84 RGYAXjKtierMHnV0pJ4gof1UUKPMKPCmOokIDdwUPqxB4EM0qmAATUiLThXaK0dPHZ+B7MSoCbt wFeMPNkLBSQLVtzVDAX1TEWOzS5agxXKDG85fgOm2ej/V9sVzcKvbpep7By+f0ZWYIGLLaZTbA3 lCPnwf2LdT51FwnEDf7XO/TLOY/r++kf07v6FmW2ns+qGfNiyDQqbJAE/tlbEi05pLuc4cT6DdV o/MYAtLNTGkcx1a8aCIi/R9HDIw9HbamzO7AVS8W+/Cxv64j
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the only change since (implicit) v1 (available at
https://lore.kernel.org/tools/ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com
) is that I added an S-o-b line for me (thanks `git rebase --signoff`!)
now that there is a DCO document for wotmate.

Best regards
Uwe

Uwe Kleine-König (4):
  export-keyring: Skip graph generation if the trust path didn't change
  export-keyring: Improve logging
  export-keyring: Add cmdline option --verbose
  export-keyring: Add an option to ignore the linter check

 export-keyring.py   | 28 +++++++++++++++++++---------
 wotmate/__init__.py |  4 ++--
 2 files changed, 21 insertions(+), 11 deletions(-)


base-commit: b2ea16b5c4d9b283151fd5ec512cd624bba3d82c
-- 
2.49.0

