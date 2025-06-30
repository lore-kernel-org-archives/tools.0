Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FAD1581F8
	for <tools@linux.kernel.org>; Mon, 30 Jun 2025 17:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304043; cv=none; b=WOwa92ef2fFL3aRPgFWw8bpLv8nAPHevR2RNY2oMZxtXGoo++5LUnhd3YfNtbCsRUzTB4Dttc8uBLK1qiqTRwbGQuFCJo/SdovIln6FHwRrzzS5fzUUVMSkQ8vQTsb4oCkyfhmvkpbqea5qiCMFA9mKDJivtpAr+Kq65J/bWKRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304043; c=relaxed/simple;
	bh=M/Sl6lE2mDRL70PYod7zwspm9+W51y1vE8TJcFjTRzU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LkSkZCM1uM48T/yUSNUZ+QzOkarlD4Via/miqYy2Ze0sTo/mTCWAUxnvAUqM4qfkNfX6e3d91ku5FacoQLKtBZsYFmlFZ7yxmPPYfF3W/kVl3EC9Qh09qR9siAGpVv+jWITI5d2wtoP3BXAtleuUrsAl/kk/jhKEXoZZd5s+s1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=T2e0Eb9q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="T2e0Eb9q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB3BC4CEF1
	for <tools@linux.kernel.org>; Mon, 30 Jun 2025 17:20:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="T2e0Eb9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1751304040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kP4HK6G9/XaL/sgRVUrSZD9ztqgnewdFCHFsOkDAXIg=;
	b=T2e0Eb9q4XZQ3lAMbdYxjZ9Px8GAi5rMkL2E3zLsw3G5DD1FpeK4o8+MQosvtfUJnqwj4+
	mWFcRY/wakD8gMibjGUhYHjuIbbEmwVu5Hhmh9zaLtvFO1DzxqsMNxCn7dMZ1GEEEDXtu5
	2F5bNB+z3GYqgZJwVyNigOgCP0W4Cow=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d402b50a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <tools@linux.kernel.org>;
	Mon, 30 Jun 2025 17:20:40 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-60f276c7313so1520433eaf.2
        for <tools@linux.kernel.org>; Mon, 30 Jun 2025 10:20:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YwyBxTAaJeTjrGiH7KxOUCK0LqVD+3/tPISNPPrby2VLA44S0tY
	MNU2EapiVQgYSbVm6VHLhi2V/9tdGgkrK8R+ntup3sTXnBUXg/n04Aqd6NgP4kppa4k4q7tfBwS
	Icc3NaRmMIQ53LtkhZGcA/1PvlqUG9OM=
X-Google-Smtp-Source: AGHT+IHAONmWAiu9LX0xD5HjXLNruB0oAwGobwasiDnTTk0oAQUy5YCp0rWrq/dFEcC/gYRlPwFStghMLlH/B3uw2ck=
X-Received: by 2002:a05:6820:8109:b0:611:4bfe:610a with SMTP id
 006d021491bc7-611b90edbcfmr8802959eaf.8.1751304039203; Mon, 30 Jun 2025
 10:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Jun 2025 19:20:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9r4wVpPMP_iUOvMZ8ppGBQu=v_Oz_MGpnQwU8nTUYP+vg@mail.gmail.com>
X-Gm-Features: Ac12FXz2jjRsNRnRWb8_VwvW-hDI5mNN5oL8r3wbqFz_HuvrxBt_b_vANqiXPYo
Message-ID: <CAHmME9r4wVpPMP_iUOvMZ8ppGBQu=v_Oz_MGpnQwU8nTUYP+vg@mail.gmail.com>
Subject: Empty s-o-b with shazam?
To: tools@linux.kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

$ b4 shazam 20250619145501.351951-1-yury.norov@gmail.com
Grabbing thread from
lore.kernel.org/all/20250619145501.351951-1-yury.norov@gmail.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 2 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
 =E2=9C=97 [PATCH v2] wireguard: queueing: simplify wg_cpumask_next_online(=
)
   + Reviewed-by: Simon Horman <horms@kernel.org> (=E2=9C=93 DKIM/kernel.or=
g)
 ---
 =E2=9C=97 BADSIG: DKIM/gmail.com
---
Total patches: 1
---
Applying: wireguard: queueing: simplify wg_cpumask_next_online()

Result:

commit 641c28eede30cecf7e262dd1191fec9679a7125b (HEAD -> stable)
Author: Yury Norov [NVIDIA] <yury.norov@gmail.com>
Date:   Thu Jun 19 16:54:59 2025

   wireguard: queueing: simplify wg_cpumask_next_online()

   wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
   function significantly simpler. While there, fix opencoded cpu_online()
   too.

   Signed-off-by:
   Reviewed-by: Simon Horman <horms@kernel.org>

What happened to the S-o-b there?
