Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478228;
	b=fKELEVWcR+OyFqsdHxfSoi3bmoVqunh02a1ah/WXGgDCro7SWab7Lqq9PFfn5CNrSg0U
	 ALdEtQCYScwfL6detP94TUryvK0Cc1EnfUj1vF6cHJIe4LNIjVKp/qk4v0qeigEMsNDhu
	 jX9wlA/q26QDKnMNEdCT5qdrDWNPPAzviq+brIjpvBKNkOnwatvjCCdFEPDe8a2Qv6yTz
	 r44bO5joUnmCCbT8V9QbpKAgLDYaLWAGUW4k+wu/Og2kRNZY5LxiXsVRdtHVlPL1DU928
	 knbUeF8+WZRtssO+wq6zk13rBfHrn8FPySiCXr9DAQqu2KQJzO+2La5IgzdpVBAm8bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478228;
	h=Received:Delivered-To:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:From:Content-Language:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DGxjIMJ1g1bk944CMw9RX/6kuiHie94I3Fjv4gLcsCQ=;
	b=PsyWJlqXKiEaOFoQX7A5pkticshXnVPszLFMp1Jo5rlAPHRZrdl8+lb21brCMktRiZcK
	 YcQrmjIx8ZjCiMAk8D4vrv9qy/nP5SuLeKd2G1yr7HkLq9lqefJZ5kw0ig9mIfQQlD+lo
	 WKuUUQoeb2jL+tUQJKK7rXmCC1HQF1QBFVK6jcO34fxVEsRkZV+uf5nMz5k+67IDUYYQG
	 00kcSu72mnlLDAOdXncQeNhHtgHx6tP6CMlgBKcS0Jpy8xFQ+RdnTb66VH/OpWyoGyRME
	 wBu4Xhp5Bzy/3ua/WCRKh18PIGABJSonrT5mNiU2He9H/4a9wljPbWDCni4OAdjmWkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXfre3ri;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67728606A32E
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXfre3ri
Received: by smtp.kernel.org (Postfix)
	id 0D7C41F00A07; Thu, 12 Nov 2026 10:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B831F00A06;
	Thu, 12 Nov 2026 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478228;
	bh=DGxjIMJ1g1bk944CMw9RX/6kuiHie94I3Fjv4gLcsCQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=QXfre3risYjfcaV9aUb0KoiEWinZtqhr0sxH6DGTjZ3HBHAr9T4T67t9FWYu8dsPl
	 FoS/4jQB8kpA0jgVfRNSh6tsOgERrdv0R+wDdOa3dcm04zGytshtVw/gWwNna0t8Mg
	 Gk1vyb5o1YStL9MOOuBTDd0F2+EqabU1wWlq9zKzjeeiHCTB7a2d7ToxDzy6P8GnB1
	 bjf4XGlEBlPpWD8H3DRTLC9WwSAUBzoRPo0Wj0IgdwGonC69ekYcEm0jitbdRHI4f/
	 pTa+nPJUvDriFIsbMlN3V2WHOFR3iNH7tnLUyYLk1yizE8BGJY0AnlPwEY5TbSO0bz
	 XycVVUKE6pCKQ==
Message-ID: <b02133f8-4819-4615-b99d-3df8eb1aecb2@kernel.org>
Date: Thu, 12 Nov 2026 11:10:24 +0100
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Should get_maintainer.pl ignore obsolete Qualcomm domains?
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, tools@kernel.org
References: <342fd0c1-671b-4487-8a42-44adecda502c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <342fd0c1-671b-4487-8a42-44adecda502c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 19:50, Jeff Johnson wrote:
> Qualcomm employees have contributed to the Linux kernel from a variety of
> domains. Current guidance is to use some form of *.qualcomm.com, with
> oss.qualcomm.com being preferred. But prior guidance was to use codeaurora.org
> (up until December 2021) and quicinc.com (up until March 2025).
> 
> The current issue I see is that get_maintainer.pl can return codeaurora.org or
> quicinc.com addresses in some cases (i.e. via --git-blame-signatures), and
> codeaurora.org no longer accepts e-mails and quicinc.com cannot be accessed by
> the engineers. And there are also cases where employees have left, and have
> not established a new .mailmap entry.
> 
> So I'm wondering if there should be a mechanism in get_maintainer.pl to avoid
> reporting dead domains. Or should we just enter all of the obsolete addresses
> to .get_maintainer.ignore.

--git-fallback takes addresses from the last year I think, so I believe
no codeaurora or quicinc woould appear thus .get_maintainer.ignore is
not a solution here. Addresses are printed (at least quicinc) because
they are listed as maintainers, e.g. for bindings or drivers (two cases
for maintainers). Obviously such bindings and drivers are abandoned,
which is a good thing to learn from the bounce.

Best regards,
Krzysztof
