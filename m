Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76E13A8FE1
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 17:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771952583; cv=none; b=FPQyyZPdj+EsrEdqdPpOs8eHcK8bV8ZZ6Cr0HcS2hC8RZ7KX63TvlN/rRr8UUcir+XIqFhPkBgnOxf7lQTMJDd9OZdF6x5QV2kBQa17pYW4qr8vIU0Av6/QIeN1VF08u01PkK+2fI0oJnwkR/NDqRq0RH0XZxoxBhVCXIi/AqAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771952583; c=relaxed/simple;
	bh=d/VUgKRe+WJ0kMjL36IF4wjn2BlKVKEds5uX0bauLRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hwckh2V+NEi6KQPtMqWL42EJjP3jOmun0pRGC7RxbcPxc7GiCBCDGL4ONGDnkcKkAxGW67xhlhYrGF5beL+xwL8TDfhn0O76D7Ar/4XhuI2692w++1HgeG9BzIbWZ+76U0DlFhvSc6QEnZNQG+uurxPDTtJ3k6IMTRhzuWXRYHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yjqwn/ND; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yjqwn/ND"
Received: by smtp.kernel.org (Postfix)
	id 9870BC19422; Tue, 24 Feb 2026 17:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B85C116D0;
	Tue, 24 Feb 2026 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771952582;
	bh=d/VUgKRe+WJ0kMjL36IF4wjn2BlKVKEds5uX0bauLRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=yjqwn/NDIzfjIyT2dZQRfdcl+GbMoppAEWSed5U6wNKLvTyeFCI9qsy1VtelA1Svg
	 ewx9PNeUepB54v9VBfNY7im74ghMKP7qcVSakYWq1yidMIAr7C/zsKTSIOxXPdW0jD
	 c7caVzoY2v3sOh9Q0+zy27obs4Fg8BeCg5ek/poM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
Subject: Re: [PATCH b4 00/21] docs: various fixes + migration from
 definition lists to glossaries for config settings
Message-Id: <177195255833.3993901.13994342303287754997.b4-ty@linuxfoundation.org>
Date: Tue, 24 Feb 2026 12:02:38 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-d0c2b


On Tue, 03 Feb 2026 14:30:59 +0100, Quentin Schulz wrote:
> docs: various fixes + migration from definition lists to glossaries for config settings
> 
> This makes use of rST version admonitions for config settings in
> anticipation to make each config setting a term such that we can
> cross-reference them easily and have an anchor in the output for easier
> link sharing. Then it migrates current "verbatim cross-references" to
> actual cross-references using :term:.
> 
> [...]

Applied, thanks!

[01/21] docs: maintainer: ty: fix incorrect config name for templates
        commit: 075798a3853e6e36ef24579162cfa57b4f68bee5
[02/21] docs: prep: add info on when range-diff-opts was added
        commit: ba986b23bf5c9cd3639d8755e2beec47e0e6ab9c
[03/21] docs: diff: add info on when range-diff-opts was added
        commit: 8decfc81783cc755227d4a3ac2eedd636ce15be8
[04/21] docs: contributor: send: fix sendmail typo
        commit: b1102e55390db0c37b55817726fb4063a2d77c0b
[05/21] docs: config: separate b4.thanks-pr-template and b4.thanks-am-template
        commit: 6d5ea09b1afb9696bb51a843ac45c74a6ab2daed
[06/21] docs: use rST version admonitions for command options
        commit: 787d38ea47cfb368a5ce3495b1b7c0cf283b27a8
[07/21] docs: use versionadded admonition for sections
        commit: 516b83309278457d93844433d8f091e08cc734d5
[08/21] docs: maintainer: use deprecated admonition
        commit: 1e8781aa3877549865a60f39d298e124b47ad361
[09/21] docs: config: provide link to git-config conf file documentation
        commit: e1478411056d6af9b00efa520ee6f6f23bbe0523
[10/21] docs: config: fix discrepancy between example strings
        commit: e0c3dd312f323f2c12e4ca6959f501bb52641c4d
[11/21] docs: move sentence-ending dots from within the last quoted string to outside
        commit: 1f2991f5fd6f824b977a6be72224b31f8ee3437d
[12/21] docs: config: add missing dot at end of sentence
        commit: 78f186e0059ec161456e78dc90c1bd18dde6410b
[13/21] docs: config: provide link to patatt
        commit: 7e2ada10d95412b18022a5ffad6b433845d70f62
[14/21] docs: config: provide link to git-send-email manpage
        commit: ce6d1d94581750993add06994765ea7b23df1e8c
[15/21] docs: config: fix double colon typo
        commit: 21c51381472723a5e10c09501efe13f7ae999e53
[16/21] docs: config: provide example content for template files
        commit: bd9fe265c68a6608d6f481c0a142d34e37c6b66b
[17/21] docs: config: use rST version admonitions
        commit: dd516611af3944c0ea24e897f8aafbf524aff5f8
[18/21] docs: config: migrate definition lists to glossaries
        commit: c7feb0050730d911dffdee65c8c89589cb0f8ec2
[19/21] docs: config: sort glossaries
        commit: af1c83586198f595223873d0bb1c6ac67f4f560d
[20/21] docs: cross-reference config options with :term:
        commit: f3863312bb98adf0ce179e105cb673eed82e8cd9
[21/21] docs: maintainer: am-shazam: cross-reference b4.linkmask for --add-link
        commit: 00c1aa82af335d1c1aa2cb881d50f3f4ffee4dcd

Best regards,
-- 
KR


