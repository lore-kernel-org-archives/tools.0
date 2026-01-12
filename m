Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951F7205E3B
	for <tools@linux.kernel.org>; Mon, 12 Jan 2026 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768247925; cv=none; b=a1jqI2rNR0g13SdV3S3FBVgJyAoPldd+t66FXfW86TLmem0JHVDRL2w/aHD9ufw2ZomlghsRpEul7Mh2ZmxfMYvM3YQViYhiFa/eBBQ7fHBjZ28DsfJgfKuCA3DNCWyIkhaDmRFfxAfhNQzi0J6vkmINpZDS1tlCOI7uDO2MwR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768247925; c=relaxed/simple;
	bh=1xceMzaZBufJp/YSxeK+wiA6HoKStjH9yeXcrINC+FM=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=IiP6AM3vnjSbUXkFLAH/TFp8Myb5OTg6OktdclkpcO2b/a0A2ysOS3S7epsTzn6qjKMlPWgLoDuZ9xdBsjGhYx5R9dSdJgPruWKbYUogY46b3TVhg53Ld8NBWlxAIlWdt61Ex0YRiVACv5qwoGSj0prdfNbS+ooTmfXWRxnLli8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbkbWYyO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbkbWYyO"
Received: by smtp.kernel.org (Postfix)
	id 5F84AC19424; Mon, 12 Jan 2026 19:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C5FC116D0;
	Mon, 12 Jan 2026 19:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768247925;
	bh=1xceMzaZBufJp/YSxeK+wiA6HoKStjH9yeXcrINC+FM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=sbkbWYyOT8WpuBqdCCEUgonuUAI5lRPzJkBw4BU4+VwXoN1qN1DfRElms1+QkZLJD
	 r/muRw/ogL2y3EZoZHyWwHx55Cj4R7H2ooXgZlJcT+/bFeSMCSb9IrHM6HMfvVNmFy
	 dmPtEcp8FuAyEGtyrgIA26lNkXl180K+fGaGluOlrxi7C4Q41zIp3M9S9PfUWmDOUS
	 rdDXoIXuhCeIthcWnYaIFyZ8dD/xHVJpZ36z9A2vubN3zGnPLCFW8qgfiTcwjXyiPJ
	 CLZBtWfqmKon35RORS4o3yA29tNRtij/aJ36uptH1hV+HpCmDvRL3sfiCFNSgLWnWR
	 VssRbvSpELkkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4255F380CFC3;
	Mon, 12 Jan 2026 19:55:20 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, bugs@lists.linux.dev, users@kernel.org, 
 konstantin@linuxfoundation.org, sudeep.holla@kernel.org, linusw@kernel.org
Message-ID: <20260112-b220969-9575b9b9e543@bugzilla.kernel.org>
In-Reply-To: <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
References: <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev
Date: Mon, 12 Jan 2026 19:55:20 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220969

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

