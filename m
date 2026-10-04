Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EC3416853
	for <tools@linux.kernel.org>; Sun,  4 Oct 2026 08:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791101014; cv=pass; b=W49dwbjgjyBjxWL0gI6MprlZUuAfbGF07OduHeYCTfY96Z5LE0UsEXWvChaMCim0Lq4u4660cVkEjDpow2VlMw7+HUufbzOrBaMYCyrCBbqu+Rej5BufR1rwtYyMzdjVcznQjaxORwuAcNCeIpxzMPLHmFZjS9BFtXUDYWsQVCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791101014; c=relaxed/simple;
	bh=l+l6w7kBLXVe+t4wFFXdX/eYoy/zwBa7aW13MtcYbTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=P8JsqwodjzFGr1PVhN/8DefH5lgOzAnW0ds07sTx077HTxjADsUgazyC750805v7bc/Hkp2Vr9HRyQvDlaKL1HkyIU/p/qB8w+DMK0WxeyF8IRJ4WUgmJCDJjH9qaIqRX5n9YacYHt/KfFSUoce3i1O7xM2/LRl2Kz62R5bRG5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=e4WMsT/m; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="e4WMsT/m"
Received: by smtp.kernel.org (Postfix)
	id B40A61F0089A; Sun,  4 Oct 2026 08:03:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791101012;
	b=Iq7xgYWVkjAotkJd1+WtkZbkPm0U7Q0QYejsdWiGkB/f9FZxhlZsymZNg8QMOMSmCPM2
	 XVqXadFUE0Oq28yrXk+7xPBrLxV95W98vXx5u8lc2O5+sTIdTKnL6KAEahfaqWzfcrfpg
	 yqkhhUL8mJLbVTcaDn7NMVz0gQuKc5XiiNvdJ6R4KZ2tKviDCf3fxg7AZG3/AxEQP9/bU
	 u7c0hgkLD6XPEITSnLvdUqyg2WCZB9bqaR2zXBHSPAsFzjXpXV/NU+iFpSQLuTmDW18KG
	 KtDlKY0FiW0RLOmUNolV1PwAMz7Rbw5xymdFVsmPvEEqFl7JbSLneSuiHe8HIB6J8nw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791101012;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Ngsq3elYtdw0KmGfnHmbwx60hh1LO7jqsE/tOLo0cxc=;
	b=KugbS5VKTqUzaoYipgi1EjNCsVC8iizW/KIsoDv/CPtZ7SDoiVLrvUYdXwXrPHbjNeuI
	 qVjvwHlSHDQDzTruatHqQND9s51PzZ8P2INhe2ArFsvJP4imLm0+qOyJ45YYAG5N7KgB2
	 TkmO1qBNkvsWrURxnJTQqK7SjvnJPFdkqk9vctOrwzfjjOJzililAS7nH2gotoynmtABn
	 6LKnAn9h0ypwD3WT6+PdJRHrZ6RRWxj7MEFxcNSe7V8wIStjB9Tzq1p/O93DyQDdbjE4p
	 ZcbrP5OuDx5cKMP0a/kj75QkTO/Gj0OUMnoVGiQ07DnTO5w30R/dukXWSuz6ZLxzQwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b="e4WMsT/m";
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 115401F000FF
	for <tools@kernel.org>; Sun,  4 Oct 2026 08:03:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=e4WMsT/m
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 115401F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1791101001; x=1791705801; i=markus.elfring@web.de;
	bh=Ngsq3elYtdw0KmGfnHmbwx60hh1LO7jqsE/tOLo0cxc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=e4WMsT/mQrwqWKkKTcNjgvGg7uEUjwkQ3u1D1mHYgtNcTtIiQNhe1RqvQgcAC4X/
	 RTnAIC6f+9mRgA1ikKWN1OSKlZa7r4QOROMpTBG4yF9Y2+ED1uwUkRH3DXwVZC3Mv
	 Jir6bWuHLBmCh+JluZVEQGdbiQJ8hUYE9DLNzwpZLbFy/GMF+B/smXg+R4U/+h3JU
	 o6u7hGEOgjPmIUeeQyUBuajfSY9m/JTN7yMgAGgESvgJ/7xiE9a3IHW14vH1fZQQX
	 gXV1LDjwih9HMWES4HXv3veyH1ycxdp/oGUVjh24XX869o9aMUdBOsIhdf5lVCN1z
	 y06s0grOjLtBjnod0Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mmho4-1wnbgt1Lks-00mTpP; Sun, 04
 Oct 2026 10:03:21 +0200
Message-ID: <05074258-be8f-4683-a515-03a845b1833b@web.de>
Date: Sun, 4 Oct 2026 10:03:08 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Reconsidering handling of generated metavariables for
 SmPL isomorphisms
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
References: <82ac5de1-a9d0-497e-88c2-c10793819ea2@web.de>
 <4f1e88cb-0332-4a29-85e9-373f9565752b@web.de>
 <8435614-20eb-55dc-871e-fc51985977c9@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: tools@kernel.org
In-Reply-To: <8435614-20eb-55dc-871e-fc51985977c9@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tPgfz7V5/e3kNacmfmgYd0/ZczjR5ZK2Qq7JF84KJLLOWhz4b+C
 KNAdrnH6e5eqw4OeslRiSyUH9R9brr2Tbni4S1PMehC6pTCKQ42uHlnj3oQbd9wXEAQBr50
 U4NzRh+5SiOuRcXFOavDj0oIVrZVnisIvGH9qCI2b1gXtXPmMgJyxctA037jd5urLJS442o
 9DmY/tBpxQfVKHhU+GhOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kfo/U0nR0wY=;0px8By77z0nMKAJGT9cBOZC9B80
 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
 5etClHKxUAaTIRf8zuCVZG5+Mw==

=E2=80=A6
> The isomorphism language is a bit simple and has the goal of being
> readable.  It is not perfect in all cases.

Would any more software users like to discuss logical adjustments
also according to such a domain-specific language?
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/2759351ca12bbf39dc72c=
6756282294aa85d06f6/docs/manual/spatch_options.tex#L93-98
https://github.com/coccinelle/coccinelle/blob/11b93adb6516a358a6687051e576=
2136666626e0/docs/manual/spatch_options.tex#L93-L98

Regards,
Markus
