Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723906;
	b=nSm0lLprKZ+112GQbEju10qkvz3uRar79Skv3VNBmRIQjhQAP1ZJTm8RRBGKErT0A/52
	 U4LD06lHLULJrHptZtwta1j77T0Lne5Yp0KifsCHZMusz2xx9lFQkynX7apSYpmi/clLq
	 0AFQDBMxT8T9x0KCsj7bPW5UUtsrHVdoAvFb1DaoyU5oDb5UzhDMBRukwGQ+0RzYQc4tz
	 HwF/9ISvko1Qq6izA0OldNBuelw/LKUGjUrDUpj5okdZdPR1zABCJSn4pTy6w3VGZHFhy
	 QtYPzxszwRQKlJtPLe1QnytGj/tKRKYtFwykMH//H85yLGsQl63tKOX3TyNMPoVzTew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723906;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:
	 X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:Received:Date:From:
	 To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type:Content-ID;
	bh=HY4Dd0Zbou7obxIpf8q47+lTpf0BW1FP4z2nkWOCkl8=;
	b=2HUEYil0u6eyrvIbptbUJoxMKK4iCY6Y7MLuYYqEnwph875fN9K1kZZEVoCfYrV0gHKS
	 of72HiYo1cbz6FMz52n5z5Tj4ZyBfy4LTydjy1YJyznxDhauARPTPUvBuOOzk9TV6hj8M
	 rLUQGainvjdc3VCzkGa0qN9JQJlBIXDlkDDoiLSAqX33eFO2CV2rIGfyXnOqluFUV9agv
	 DJZ4Ct8kDt/YJKfzYnY9jqEGbWuxipxxcLvTMvVso6t62TwFsA5jdDI5NEL9oq2tC6CiB
	 L82+3omuv39OjAakTHFZwTjlaOW+KnHZdmUbe6xjYTlrHDRPtm3zKAEpncBNv5TS19Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=JmkENaVU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25862606A324
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=JmkENaVU
Received: by smtp.kernel.org (Postfix)
	id D13B11F00919; Tue,  3 Nov 2026 16:38:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793723905;
	b=QcpfmsmzNBYvWyqhVpOYmvAM5ufZE1iLldQ9wEil7mH+1lZgPfwZLGFHkTcBmxQ8RXU+
	 3YDXKpweQstb/YiMw6hbtrVg6/tP/AsnVs82RN56UzXzem3+aJWAcayqWildYrAw4QesP
	 qKxsAsSG7gjuW04c8t23Qs949EUQ/ntb89LwyP9G/zcLe4lXi8pwRS440xu6otkBpNTA2
	 FHA+Yga3AFv5tJRpQPXyVEALIA2c73o47j6AaWNidoOxBKUTb30NbvW8qyp4hyM75mf02
	 1dAjkEO9jzSRHMcjlUc4fT6p6x8AW5om38CyMbVlcxrSlnq3MYtirguukhp4Wcqnh4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793723905;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-ID;
	bh=HY4Dd0Zbou7obxIpf8q47+lTpf0BW1FP4z2nkWOCkl8=;
	b=1hXnOLaImlSjKelRIZiaRQb3L1zdkaCPLJfGDOPLitgIgOnIieaNkflNB5l2cqq4PF2A
	 9lCBM0bfYguvFwgPs7Dpqf51dGiBwbCZorobv1TVd7v4jz3emwsQboIVM/38rSjR5kp/K
	 NZade466oyWP+MmZkrwiK85dokw4IREzksXW276II8RPAEtvjd1ib/QKE7J8ad5m/DWRx
	 juAPWNYfccmMsNP9408YU7GpKKlfISaSwUQ/B0Rt/anboxQCnuY3sPfKTjxKI48hdaYzE
	 vmhkRFalov0oBF8tGuCurzuBHkG4kTeK4n6Pfnw8W/wBOIVuialY6bq8DWVwKHUJwyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=JmkENaVU;
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9D7F1F000C1
	for <tools@kernel.org>; Tue,  3 Nov 2026 16:38:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=JmkENaVU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E9D7F1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=HY4Dd0Zbou7obxIpf8q47+lTpf0BW1FP4z2nkWOCkl8=;
  b=JmkENaVULp79A4IA//PvHHncEPCo3gjPpWx1T0OwcZckxWgZXDADpLwU
   JghimYRMpYedMV4uF/XRiFZ0IUACwkwwsgtFv65bUD6TqRPJBAb6pXt9e
   0C2FvgyLNki47STtrDoqcC4tl9EIF3USRc7qrHeS/UtDMl/vwwlbTLack
   o=;
X-CSE-ConnectionGUID: +EappCgOQEWmrcq4ShxV2A==
X-CSE-MsgGUID: z9Yaetg/SMCm4g20GmXW3w==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,193,1787004000"; 
   d="scan'208";a="161648430"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 17:38:22 +0100
Date: Tue, 3 Nov 2026 17:38:20 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, tools@kernel.org, kernel-janitors@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Replacing special goto statements by direct returns?
In-Reply-To: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>
Message-ID: <161f567a-f33-7865-8787-844a299ef9c1@inria.fr>
References: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-489044682-1793723734=:3641"
Content-ID: <791c737b-3292-d1ac-a25-2578cac8bd7@inria.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-489044682-1793723734=:3641
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <d52ad096-714-ddd1-6ad5-f1ea219fc09a@inria.fr>



On Tue, 3 Nov 2026, Markus Elfring wrote:

> Hello,
>
> The documentation for the Linux coding style contains the following information.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v7.4-rc1#n526
>
> “…
> The goto statement comes in handy when a function exits from multiple
> locations and some common work such as cleanup has to be done.  If there is no
> cleanup needed then just return directly.
> …”
>
>
> Thus it seems that the following script for the semantic patch language
> can work to some degree.
>
>
> @replacement exists@
> identifier label, var;
> @@
> -goto label;
> +return var;
>  ...
> -label:
>  return var;
>
>
>
> Unfortunately, patches would be generated then by such a simple SmPL code
> which would still preserve return statements that became unreachable.
>
> Test result example:
> Markus_Elfring@Sonne:…/Projekte/Linux/next-analyses> time spatch --allow-inconsistent-paths fs/xfs/libxfs/xfs_btree.c …/Projekte/Coccinelle/janitor/replace_goto_by_return2.cocci
> …
> @@ -1735,7 +1735,7 @@ xfs_btree_increment(
>                 --lev;
>                 error = xfs_btree_read_buf_block(cur, ptrp, 0, &block, &bp);
>                 if (error)
> -                       goto error0;
> +                       return error;
>
>                 xfs_btree_setbuf(cur, lev, bp);
>                 cur->bc_levels[lev].ptr = 1;
> @@ -1747,8 +1747,6 @@ out1:
>  out0:
>         *stat = 0;
>         return 0;
> -
> -error0:
>         return error;
>  }

I think you can do:

@useful@
statement S;
expression error;
identifier error0;
position p;
@@

S
error0:@p
  return error;

@useless@
position p1 != useful.p;
expression error;
identifier error0;
@@

f(...) {
(
<...
- goto error0;
+ return error;
...>
&
...
error0:@p1
  return error;
)
}

I have not tested this.  It might not work, or it might be very slow.

julia


> …
> real    0m1,074s
> user    0m0,995s
> sys     0m0,071s
>
>
>
> How should such a source code transformation approach be improved accordingly?
>
> Regards,
> Markus
>
>
--8323329-489044682-1793723734=:3641--
