Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF291487F4
	for <tools@linux.kernel.org>; Mon,  6 Jan 2025 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172709; cv=none; b=c7bZLWjIWYl1T6tYomaEMBYKng8l4oTU0Mh4bFLfFw1KdtrTIHzqF3c0x6Yl6Xdsc7m/Zn65oCrwFn6bs3gaRjcgwz9gBIQ7YQmKNduMaVwt0NJzX25B41eIPWdqeJAQsS3lAch46RlA6+txUBKV1G1NgHNmRe23i9OolD2DniI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172709; c=relaxed/simple;
	bh=D0W/p26O+ODfcb1P2YZkyxBWGoQOxsmx3Foc2R48ihE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/Mjlsk1MMDxv4icrCN214ujKvMwkHqTAMq+i3Simq6NhH0SL0ChPWiNLXOhul6dDK68Wl5piaxwoeSVtvLIuJ2YBVJ5S2Hx+AR98OJQJW6XnZMP5PwGS/dmxrjJeohDXHVa11Y8Q/IdQlk5sh8+IFxf0weiFJnYlmEvJzWCI5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b=t/uWxQef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b="t/uWxQef"
Received: by smtp.kernel.org (Postfix)
	id 79FFDC4CEDD; Mon,  6 Jan 2025 14:11:49 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E9D6C4CED2
	for <tools@kernel.org>; Mon,  6 Jan 2025 14:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E9D6C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1736172705; x=1736777505; i=j.neuschaefer@gmx.net;
	bh=DkFMcUNLa6N3jNBh5qiVdIYunzfuO9rnCsyjEV98PVI=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=t/uWxQefmSXZKrBqZUn1ptTDGtPCiaZSlraDJwQZ5DjTFUnYRChfmWQ2QlQfL1lY
	 6sLzeWuCTHL1QhT7ZzO0oz0cXjL+OVkFHgIZpL97U1PBpf3oi5Ixzx5HyX/EKudIS
	 EPdBlBjdzN1DFowXGAGOfa902fuxMaIe+pSWWwgif35RkyE39L1mJSnbgjn+wNuZc
	 urgssICBq5w8ce7s4Y16Qxwh1x5kiylWxwiISMJHBMGz/YQ8/wT4JWVS2RaoQzRGV
	 rf7TJU/LURyI5yk0zDXIzWHbxiUe6L0DD6xl+O3p8DBsTOejeIgnAvvEEegL73tPL
	 TvJZ56JMEYwRySgLtA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.170]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU9Z-1tyesE08Ul-00dnPk for
 <tools@kernel.org>; Mon, 06 Jan 2025 15:11:45 +0100
Date: Mon, 6 Jan 2025 15:11:44 +0100
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: tools@kernel.org
Subject: "b4 send" only handles one instance of sendemail.smtpserveroption
Message-ID: <Z3vkoDal1ShoPpqG@probook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:1aSGJD14KOcZkD1WpNkRo33tEXw9zCgaXJshYk7EpjWe0SanLt3
 i0qNLNMxHsGLZ4zMZmfK9d75Te7EjndTUE2Ogj7rZHo2pPM0L8PQBiIjefex4aZoEEKd6oF
 XkcQAmay3c1w2SmelY0qyeRZF13zidXpK7htluffhg/e1Vldytglis1EjvBNENNS9pVqaeq
 2h5d+pz+r5PXfKnT6iy6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Qv/pQh0V4+k=;fGXtkYSVN3JNjcEN5USe5xeAnOy
 wbdfrWX7yAN56JFOo/LSQ5WE4pLbYv9zDOZfjMCIkt43ngfkg0jhcJY0kTQLWVfTCcDJewozi
 mHVQv9zd/5sN7fMwaOfoZqubkNbU6Sz66SBnr+dahC0CNhcsphAr1WOR1mYUabls1BKG0N1X4
 i5+kg03xGTb+b1ZcG0tZrQUvtWxFXeg0khtw8fud+emKCFIWSDXNxepXqFxYIm25+as+J830z
 BhsmDnjGBxyvYoOowExAEwQVE/zxHD2/3WMtHz9T2LCO2/UfBQiotfyiN4GeTKUnb4hDaUIt2
 3IFEIkJhx33HY9XMIzNIwYTaYJ0cIoWR6lc/y6LP1q6ac9zN0c+ClKtOI0pt3PsG2r9CKLFvl
 /KgXGq4H2uLKa1inVIxwa3TAhRzpWJSejVd8JrN12oindH1EmaoadejwhObjBf1CxeCn2L8Sw
 3bUC4BFBSPAeoXCdQ1+Hwcjbo9BkVYJuUhNlDxynGeCJkzjlrfNy5dwAONkge2DIlkBAjcNu7
 8mgdtVIjx4ZudNlRx2juHC0leUJfuiwgUwiMdKPuzEv3S96DEHeikuqb5eyTVDFHpVd6PugIp
 hxXN9ZnzR0Nucl/8YPYRzmx879J/VhvIf8st8PzXoaisg/8+pLI7cXbaQun31T53unESBjNh9
 OfRZVJ29pjoza5EFjZgYswUyMPpwoZhZDbYUAHDsbcGOQG4BKRzG63kYwHJFGJZHftBA4xpY1
 Xee1UKenGYNCx9WdoFGaDn1XdcVTPSK2UM27yqoUYl7YiXiL92Bx0zDHyapdW+jPXMTnXjqnm
 vQcAKT7HnYKvWhQjzUTuj2A7sZ2aEeJhsJg/a3IwZtH/H3CnkJOeLHa06qPsF52tF79nRSWdl
 ixyQRu4/r9fk/EDyuu34ejyThaTdtPSfd+H7UuIBmuTV2zxyc1LVYAry6bxf5gLVLIyOE4xKp
 ssiJglgqRfeOvuEKXbCvU0GpTx/Kd2HC92KY5XMHCAOSWxFqrLno4tyVeEvIajkVvqqyC2aVh
 nc+cxJguZ8QKj+CyIBzG8RIj3CyTuFeZ1HKj1h3SAX4/NFxZpmj9EtshtLwe5CNdWQKjsFdTM
 j8bcO2Gu75lgozBIb8vwOmHcK7b24Q

Hi,

(using b4 version 0.14.2)

first of all, thanks for implementing sendemail.smtpserveroption in b4 :)

Upon trying to use this option with b4, I noticed that the resulting
command line only contains the last instance of
sendemail.smtpserveroption specified in the git config.

I think it should be possible to specify multiple options:

(quoting manual page git-send-email(1))
> --smtp-server-option=<option>
>     If set, specifies the outgoing SMTP server option to use. Default
>     value can be specified by the sendemail.smtpServerOption
>     configuration option.
>
>     The --smtp-server-option option must be repeated for each option
>     you want to pass to the server. Likewise, different lines in the
>     configuration files must be used for each option.


 -- jn
