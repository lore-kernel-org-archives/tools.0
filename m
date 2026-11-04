Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793797132;
	b=DKixSbOO69MKC/AS8ZS+CRU41kExSZnacFRA7ZzPXT1Xx5Rc1CfUcehe86BMt00ImAjt
	 UIXA1/qT6weTnYkPty45N4iH8XaD3PSoNq0v1GULovfHwILdCsF4sEMdnPFlo4ZFVF3xw
	 ZVUntOBnUW+DBIUiVTYJGKpoS4uMJOo0JiHdw8amRNLW8WhXwI2zhVJDZLimwWQ3G50Wi
	 0MVYxIfhPQ0aNiH11D/AkPmltb4aWT3OAwVHdQzDX9zeq07iX3wygjXstM+6TfkD+CrZK
	 N15e97hTVAv8xzmD0/JF1GiwDWrLobWVfqPca783u+7+zxzUdSw/2AfZ6M3URjZziOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797132;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Egu91q9dU04uoNuu9WJS9CZKlSh0KIIUE3pyY4OkdX4=;
	b=ojfimMBlr+5IJyuUeO/K3dbPkYMvsABcDkDQg5dKRZ6+ar+zuPeVcurC+HFmwZhS0/ZW
	 T/vTDKjd/l1kNmf2qPfd77RxZj42DymF2g+vDgk9VnGdH54KGPw6i50ibzq/bA53YXAtK
	 M1aSU7nqY147I+F7Dmt0nKkw8LaMo/bQrPaCNtA9EbeCfoQZht2HyUtj606lpnHN6YKSM
	 Mz2wvWcP6gpZKEn9R6Qozq4BJvuSaWIyMHR2mTh4pppFNnGgQp/azC/5878TNSJgjY738
	 UTT3SohMFk741Kfhqbg1kj2I9mpVKjGwW0/Z3gOvLWcrARAUpjesSuZeZslZVZcTvSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=OUs8wh9K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C142E606A338
	for <tools@linux.kernel.org>; Wed,  4 Nov 2026 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=OUs8wh9K
Received: by smtp.kernel.org (Postfix)
	id 7CE4F1F00A1B; Wed,  4 Nov 2026 12:58:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793797131;
	b=JT46Km2rumZzdbJtuCmewXOeWF37LJE5k0LB6A3XaWHDASK3na78T/4j9koXS9sz3Pnf
	 aFMO4qU+jN2ktTEcVZdsiZnYNAA9YBipVavn9x565b2m1p4c2n1/XdIbrVWCESNNNyCxO
	 KnqQHB9vf6k0UbEt4IDbDgkfmJc+r9Ey6wHpDMydtrzIQxFG34WW/xGlSQ8vJjOxZUQOv
	 gvKP3yC6A9QYhZpP/KY0sljRTNK7za/g2JSpQ6+fnkzhjjqYYyynl9jMA8x8x+T4TCkp3
	 DratZxuPXI8a5sevWuEY0hdg4oigcNCE/0fo2gLlm4CJs9DRx1Uv1+jTz2Uf2gkIhcA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793797131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Egu91q9dU04uoNuu9WJS9CZKlSh0KIIUE3pyY4OkdX4=;
	b=mpN59PM5kWQcPzj5Y38y6B0uCa5S231j86tvG577P+TLPPxbeLV3l9DLpwdKIg2A+U64
	 mKmGU/krajsHbf4baIVmfvV/uW6KUIvBoZRjbHmw3TbBbWxfmPEDdRiiBx7bVwKB8oDEC
	 dl4k+g0fvVIRifxIJxTm2aPTk5kTsQlU50uXo8nYLn9eLn+qKQqRNz5Z41VTZNrKAC7Et
	 I3ZT6G25TRXUrL+28jbcbKMu8oIPDWAkbhZhBnCHVADlzWPb5V340Aje1Y+yQz91Lu1LY
	 EwVU0WSxFQmg/MtTv4ErH3LJ1oCV5qFsqdsnNotm3ZIDdLa9DgklHGtKJ0Xa/mSJRBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=OUs8wh9K;
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 784141F000C1
	for <tools@kernel.org>; Wed,  4 Nov 2026 12:58:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=OUs8wh9K
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 784141F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from macsyma.thunk.org (pool-173-48-116-148.bstnma.fios.verizon.net [173.48.116.148])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6A4CwbhS032333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Nov 2026 07:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1793797121; bh=Egu91q9dU04uoNuu9WJS9CZKlSh0KIIUE3pyY4OkdX4=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=OUs8wh9KKUg7+SxydXoXfOJGoUaq6ntqze1koDf1tO/a3+JdxVimnbNE+joTKqEQv
	 4Z7PcLlqNR67xF1Az9aFt5REhBjGjHs7sjsTy0JKibAdG9GYdJxDPd6lw+Dk4DVNxz
	 xoaCGhpOLlqkpNdxPyiLg1z/rwo8QhZaXMNCDvcm+4uBhV7jBbamr+4oinQxcmNrGi
	 LLmZafzFODALBwGI4UpWiYptMLVN+0Q1cf3j8ufXYQraiBNAFQ6z6TpKmTSjiGLh8L
	 jxiClPFSaYLAnYNBw3Z7tyDuXkwfYq/IztP95AgCEZSgRsOz4rW393o+omQD4uAHng
	 K51tCPtxIU4FQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 7CB22253005C; Wed,  4 Nov 2026 07:58:37 -0500 (EST)
Date: Wed, 4 Nov 2026 07:58:37 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, tools@kernel.org, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Replacing special goto statements by direct returns?
Message-ID: <ausnPnWk9qSCnWad@mit.edu>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>

On Tue, Nov 03, 2026 at 03:23:23PM -0500, Markus Elfring wrote:
> 
> The documentation for the Linux coding style contains the following information.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v7.4-rc1#n526
> 
> “…
> The goto statement comes in handy when a function exits from multiple
> locations and some common work such as cleanup has to be done.  If there is no
> cleanup needed then just return directly.
> …”

I wonder if the churn in this sort of clean up is really worth it.
There is a very large set of AI-generated fixes for AI-discovered
security vulnerabilities, and so code churn that doesn't actually
result in net benefit in terms of making the code more maintainable,
or more testable, or addresses live security vulnerabilities may in
fact just make maintainer's job more difficult.

I will say at the moment, for me presonally, this kind of cleanup is
very likely going to be significantly down-prioritized in terms of
code acceptance because I'm really swamped with patches for ext4 and
e2fsprogs --- patches which in my opinion are much higher priority.

Cheers,

					- Ted




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
