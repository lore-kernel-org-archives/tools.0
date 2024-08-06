Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FDD9475
	for <tools@linux.kernel.org>; Tue,  6 Aug 2024 00:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722905040; cv=none; b=C8OaWcnfBOJYEiUNKNoTzy5ehjOVwN1GCY8eFQ2Ycgp0k2YiY9Hyz8jJjxMGI8IhOyKvy8WOBPW05kzTEeAWjKmaMa9r/4gc9RO3oFcznWHsqgR0q/MWptdjDZ24SWJ64NA69MazJIYVL08Jz7uoTqbByjvdtglfmtisMHdii38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722905040; c=relaxed/simple;
	bh=Uc0XluplE8D/qCKzdNJo9tUTt9qyUfGI79Bvs2KZjnQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QR93CUIH8Fel0TAEW+UqBd/k1ta52rnqxM8EZP6ceETCTFVr9npIDZUPpQgosujtDa1BbWBTV4QvoNh6p0rx4lYd7QGEsV19VIDFwmIMS+Mb9TozFPCdF1A3BxYH5064VpSOUd3Dr0CRwKo1OSWAtT8kLmL6cGXVQse3Bxn/e9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=myse9Q8Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="myse9Q8Z"
Received: by smtp.kernel.org (Postfix)
	id BF3B3C4AF0B; Tue,  6 Aug 2024 00:43:59 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45E61C32782
	for <tools@kernel.org>; Tue,  6 Aug 2024 00:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45E61C32782
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ff1cd07f56so257895ad.2
        for <tools@kernel.org>; Mon, 05 Aug 2024 17:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722905036; x=1723509836; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a3l+4bI7AwePxCwd4TxNBtDu1jg1nlLgDsZZMc+IwGE=;
        b=myse9Q8ZQsNrLpsnTgkM6c9WCMGikE5Sa+ZYhj64OUHutFlSrCx3rrE2bIeWOmEMDg
         eoFLdTKIE374H+OXotQQ9kfbsUM7Iaif5JuR84og5tP2RIswtjviutIpPx6OwooMbbQS
         O/T9+2H94TKgZuMvYpxOrAJFUihA/oVucUtKFEL5JqkxcsDv7jK6rxbJbvJ2t98sNLMe
         s7XqVZO65alZK46epPqZkfMkG1wLzq4H4OxbxEpqHT8Sv4s56e6fp8Whfnu7K99tm1CD
         2hAeYB/adpifOX4T20YVUmYRfIWzY/hcc9KywolA+XRoSdHHB4+Fw4zdYvFN3wdgn1Mp
         fd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722905036; x=1723509836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3l+4bI7AwePxCwd4TxNBtDu1jg1nlLgDsZZMc+IwGE=;
        b=CMf83Cc7Rb/WwTn9ExuBkBYGId8bDZjyaa8ix8ZZL35dYCe7gqwrP1kEAqjz+kiQdi
         /2al7C3LuNWDA/tlTil3u3IZUjRd3U6dTgj0s/Tm1kZuHqiXm4Y9pHEkISk8WZLDETD8
         gCrd4NwGDhMUPokv7otydJIowdVY0KD6bQ8M66lgM8tDuB9cHtQ2X8+jHImcIq3o5lg7
         hmfytz2z3OGSPcIHtmA3OCefG85cVkFTn+GDBBy555TcfgcNTkgi/V8oEL2K9Xza682v
         3fGPPX7dXA3Fran/zXN3BGkVueKkYNLvZ38WKXm5Rchv2dCYB++dVfaCR2aEccaK1G7i
         9YdA==
X-Gm-Message-State: AOJu0YzpRKYRz+ZIDyX3cTMwMe+DPgqUuPI10AYVXlcciJ298sY9HxmP
	9tBUu5LKhAKR7SpQRXQJ3gfYcc4dC6uhT+NWW+27wr10ijGdphy5Vz3Wb/SlLT0lkkigyw8hWBv
	GDuI=
X-Google-Smtp-Source: AGHT+IFHDVAzVxursdKpJUlgT+LphlBtRLvt8uWoWyIIks4ClTQEZ5nx8BC0P2BJcf28+vITAUX7Yw==
X-Received: by 2002:a17:902:cf01:b0:1ff:3c4f:e93d with SMTP id d9443c01a7336-1ff57462779mr155911865ad.55.1722905036103;
        Mon, 05 Aug 2024 17:43:56 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f6a540sm74985195ad.118.2024.08.05.17.43.55
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 17:43:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tools@kernel.org
Subject: b4: prerequisite patch-ids generated in wrong order
Date: Mon, 05 Aug 2024 17:43:55 -0700
Message-ID: <7h4j7y32gk.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

In this[1] recently submitted series, I specificially listed:

  message-id: <20240801195422.2296347-1-msp@baylibre.com>

in the dependencies (via `b4 prep --edit-deps), and during b4 send (I
think), this turns into `prerequisite-message-id` in the trailers of the
cover letter.

But also it seems to have taken that message-id, grabbed the 3 patch-ids
and also added prerequisite-patch-id to the trailers.  That was bit
unexpected, but clever.

However, I think those patch-ids are not in the right order.  Because
when try to `b4 shazam` my series, it fails[2] because it is tries to
apply the prerequisite patches in the wrong order (PATCH 2/3, PATCH 3/3,
then PATCH 1/3) which fails,  as might be expected.

I'm not sure where all those prerequisite-patch-id are generated, but
there's something fishy going on there.

Also, a dumb Q: why isn't the prerequisite message-id enough?  Why does
it also try to generate all the prerequisite-patch-id fields?

Kevin

[1]
https://lore.kernel.org/linux-pm/20240805-lpm-v6-10-constraints-pmdomain-v1=
-0-d186b68ded4c@baylibre.com/

[2]
$ b4 shazam 20240805-lpm-v6-10-constraints-pmdomain-v1-0-d186b68ded4c@bayli=
bre.com
Grabbing thread from lore.kernel.org/all/20240805-lpm-v6-10-constraints-pmd=
omain-v1-0-d186b68ded4c@baylibre.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 4 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH 1/3] pmdomain: ti_sci: add per-device latency constraint=
 management
  =E2=9C=93 [PATCH 2/3] pmdomain: ti_sci: add wakeup constraint management
  =E2=9C=93 [PATCH 3/3] pmdomain: ti_sci: handle wake IRQs for IO daisy cha=
in wakeups
  ---
  =E2=9C=93 Signed: openpgp/khilman@baylibre.com
  ---
  NOTE: install dkimpy for DKIM signature verification
---
Total patches: 3
---
 Base: using specified base-commit ad7eb1b6b92ee0c959a0a6ae846ddadd7a79ea64
 Deps: looking for dependencies matching 3 patch-ids
Grabbing search results from lore.kernel.org
 Deps: Applying prerequisite patch: [PATCH v8 2/3] firmware: ti_sci: Add su=
pport for querying the firmware caps
 Deps: Applying prerequisite patch: [PATCH v8 3/3] firmware: ti_sci: Add sy=
stem suspend and resume call
 Deps: Applying prerequisite patch: [PATCH v8 1/3] firmware: ti_sci: Introd=
uce Power Management Ops
Applying: firmware: ti_sci: Add support for querying the firmware caps
Patch failed at 0001 firmware: ti_sci: Add support for querying the firmwar=
e caps
error: patch failed: drivers/firmware/ti_sci.c:3113
error: drivers/firmware/ti_sci.c: patch does not apply
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config advice.mergeConflict false"
