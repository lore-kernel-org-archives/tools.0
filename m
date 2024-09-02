Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704D1CB53B
	for <tools@linux.kernel.org>; Mon,  2 Sep 2024 17:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725297032; cv=none; b=PfJbPjBt+xKr0GWCpFk7ozIHaWt29FakdV0wkIoHveZ7sC9+yy2mnWx1FuGbtkOxTGP/Od4AAx7fAZmjwPA2fc9/TMWmwRBD9A+ydSrTH/noYS8Dou0lPycp94ZIUEuyWnw6UyyBOadRFh7Iz4MkCMB2ZNzdJkP+6vG6qC+mBGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725297032; c=relaxed/simple;
	bh=h4IEzlc1OrSJJmSsU52mE+kVncL3U7Yavn3gqE7+IWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJv2gx7jKr1mOeg9VIHegVtZ04SwygX45r+yqXqwm/YpANRfGClHzK3h3nlzTWnDHJoeCtxYP3Zmycklrtn5c4uJH3H0qBacMOlTMpKnCifK+6icDudZ7lvHOo/PQeeNSWxDCxw/0Ve6fGD1mEVqcoMK92ZmPeNOPBVF/C04+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amqlvnxo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amqlvnxo"
Received: by smtp.kernel.org (Postfix)
	id 662DCC4CEC7; Mon,  2 Sep 2024 17:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FDDC4CEC2;
	Mon,  2 Sep 2024 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725297030;
	bh=h4IEzlc1OrSJJmSsU52mE+kVncL3U7Yavn3gqE7+IWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=amqlvnxouCieJa/r9IhqFh6DwM0U46am6awoeeK9kHvIR+4LuZrep0C0jA7RCcJxY
	 91XCLw9Y+6ltOtugHNKPZU+g4zO21DNdPr29fVnvKsTlHPMpXZVeu2UPnu9Ng1Pgjt
	 8ZFbpNsBojOgSArHiUiepLvUFCf341q9Eab0aQP6bcOHitHhe7V5r2RSiSo6GTK8ez
	 EfFwCewz0UzNxAcSFlSTr3lAu8lCpsz7lmJQaFyjEDE27Ti4IDkA3/wmb3fbhabPkq
	 L12HcKun8aeZdl5Ik6nGD9AtFCNJYcZpt69eYIKTsyZPjhUHDMjlEapiz7fICpFcrU
	 vPqSGdyrpRdIA==
Message-ID: <c3ee39c3-afae-4918-a82d-148cf62c93af@kernel.org>
Date: Mon, 2 Sep 2024 19:10:16 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [b4] add notes to patch for commit with git-notes?
Content-Language: en-GB
To: Quentin Schulz <quentin.schulz@cherry.de>,
 "Kernel.org Tools" <tools@kernel.org>
Cc: Farouk Bouabid <farouk.bouabid@cherry.de>
References: <4bc5dee0-ed3a-442c-a9ee-d48050627576@cherry.de>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <4bc5dee0-ed3a-442c-a9ee-d48050627576@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Quentin,

On 02/09/2024 18:51, Quentin Schulz wrote:
> I think it should be possible to use git-notes for the latter?

Please note :) that these notes can be easily dropped by b4 itself when
editing commits because it uses 'git filter-repo' to do so [1]. In other
words, these notes will be dropped when using 'b4 trailers', or when
using some 'b4 prep' commands when the cover-letter is stored in a
dedicated commit.

> The diff we had for b4 to make this work is the following:

The diff you attached has already proposed before in [2], but not
applied because the notes can be dropped.

> Let me know if git-notes would be fine and the direction to go for
> patches. Thanks!

Unfortunately, I don't think that's the right direction. The alternative
is to add the notes in the commit message, at the end, under '---' [3].
Maybe the direction to take is to document this alternative :)

[1]
https://lore.kernel.org/tools/20220929074717.u2xfvfwq4ki732tw@wittgenstein/T/
[2]
https://lore.kernel.org/tools/20240131223054.371692-1-Frank.Li@nxp.com/T/
[3]
https://lore.kernel.org/tools/jx7vyqdj3qt2zwgsxh6hjac6osr52n2vcmkj2pg3elapcth62m@jtl27si2pa3g/

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

