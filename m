Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D093C4162
	for <tools@linux.kernel.org>; Fri, 10 Jul 2026 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698682; cv=none; b=F6YPY3Ru9Zc2MjclfKMlu8nFZOunYSoG08kGOxBB3nAxU8i7jFzan6Hwhob1Uk1cQjp4Ar04GEQ+GQF3MM+cKV0vn5Vk7xr0YxZNFIGgW4uy7VZB3U3rGU9tzG8MGMsDKce7Q4u/8Y+y7OoFWKaVdIRh7TQ+RfHPkyDzkYzr7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698682; c=relaxed/simple;
	bh=h9hExL2qXDoParuv3eRwwAf6JJYg+UnMriCxyXtXCrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSJbsA2jrzfTU959wG3s7Y1oApZGsxa8ybL5/Zu/1RmyXg+yynEzj9OzEcmcxr1mkgrDo2IzKEfsVvPNtfbfN8XyE1P5ycIbzkF9fW8lu0EaxuVvBHeimgRZgzO+gsom5vQ8KupdQ8xF1u4n/sRxeeQmxpB64zW5mvSaM3WFMu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDog+65I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDog+65I"
Received: by smtp.kernel.org (Postfix)
	id 546CE1F00A3A; Fri, 10 Jul 2026 15:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831B61F000E9;
	Fri, 10 Jul 2026 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783698674;
	bh=o4ICS1y8F5+UyDu4Q4CRUyNK92XvMe+3uFVpGS5jVos=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PDog+65IaqBqFKkMyq2ANNNS2XBKtHhaBqFUh+xWjMV8bEj1FFOycTfCi6cUdMmRH
	 sSiEbNzm4hqT+anYu2+MVZiV9QlMY4v+SQnZ/pZko88XilHwihtd8ujPukL+Go1W0o
	 1/yDXW05enrT64IbNsLF68t7Wtja9A1Y0KvjchrEMQ/Ek+481/kYjUCVGnThzw1B1s
	 r9YJq9xJtFj+yq/Z7Tg7KY/dDgf5iROL8L+U4ccOEU8/MQvOcNDgvJCFmrqBaofLyj
	 I4WCdCFIsycKdSBWTwWYL8OsFjTGOXzUrGD4Bry3L3BkllM9HqV1PeNJT8OWaK2rME
	 9tuHFQu/j716A==
Message-ID: <a7e019e7-584f-4be4-bf15-c3ac51be8edc@kernel.org>
Date: Fri, 10 Jul 2026 17:51:10 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH b4] config: accept prep-pre-flight-checks from .b4-config
Content-Language: fr
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
 "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20260710-b4-config-pre-flight-checks-v1-1-ab16cf14a00c@baylibre.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20260710-b4-config-pre-flight-checks-v1-1-ab16cf14a00c@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Clément,

On 10/07/2026 17:14, Clément Le Goffic wrote:
> The .b4-config file is a convenient way to share project-level b4
> configuration among contributors via version control.  However, only
> keys matching a set of glob patterns are currently accepted from it
> (see wtglobs in _setup_main_config).
> 
> The prep-pre-flight-checks key, which controls which pre-flight
> checks are enabled or disabled before sending a series, is not
> matched by any of the existing patterns.  The closest glob,
> 'prep-*-check-cmd', only matches keys ending in '-check-cmd', not
> '-checks'.  As a result, setting prep-pre-flight-checks in
> .b4-config has no effect: the value is silently dropped and the
> default 'enable-all' is used instead.
> 
> Add 'prep-pre-flight-checks' to the wtglobs list so it can be set
> from .b4-config, allowing projects to disable checks (e.g.
> needs-checking, needs-auto-to-cc) that are not relevant to their
> workflow and share that decision via version control.
I don't remember if it was present in this list for security reasons --
similar to *-check-cmd at some points [1] -- but I do remember a bug
report with the same patch [2] which has never been applied.

On my side, I think it would be useful to be able to use
"disable-needs-auto-to-cc" on some specific dev tree of a
"sub-subsystem". On these dev branches, no need to add extra reviewers
from the "parent" subsystem.

We could then have this config:

    [b4]
        send-series-to = <dev ML>
        prep-pre-flight-checks = disable-needs-auto-to-cc
        send-prefixes = <specific dev prefix>

[1] https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a1360385
[2] https://bugzilla.kernel.org/show_bug.cgi?id=219705

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

