Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5E72E845
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1VYmPJj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1096C433C8;
	Fri, 22 Dec 2023 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1703272311;
	bh=rU4FZB5yFVLDlvrv8YnsXtSp7/u7eWQtjylfHMfnGKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1VYmPJj7MECLzGYVv10KM6xu1gKjyqXWbGxyjgQUMjhvvycMlsFgjy00zhFL5kv+L
	 2JYPS0tsqIFEr1rSR10e+SVsMSN1+yMoahSH7RYH2cUWeOZI4o4QwnJKWXFfT3ed88
	 lkVgfY6Egxllor9iSdQgSw9DprV+eHV7r5JG5jgk=
Date: Fri, 22 Dec 2023 14:11:50 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH RESEND v4 0/3] livepatch: Move modules to selftests and
 add a new test
Message-ID: <20231222-groovy-llama-of-pluck-feaafd@lemur>
References: <20231220-send-lp-kselftests-v4-0-3458ec1b1a38@suse.com>
 <55b717dba239f3bedf0da7e25925e390a63459f5.camel@suse.com>
 <20231222-horned-caiman-of-freedom-3fec0a@lemur>
 <f5c38763b4d42cfafdaac24d83ec18b81dfc073a.camel@suse.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f5c38763b4d42cfafdaac24d83ec18b81dfc073a.camel@suse.com>

On Fri, Dec 22, 2023 at 03:52:29PM -0300, Marcos Paulo de Souza wrote:
> So my usecase was that I first sent the patches locally to my
> colleagues, so I used
> 	b4 send --no-trailer-to-cc --to
> colleague1@suse.com,colleague2@suse.com
> 
> Well, maybe adding a confirmation for the user that the version will be
> bumped. A new flag could also be created b4 send --keep-version to send
> without bumping, thus avoiding the prompt?
> 
> Is this too convoluted?

No, this sounds reasonable -- we do need to support a "hey, can you look over
this pretty quick" kind of action.

How about the following:

    b4 send --only-to colleague1@example.com,colleague2@example.com

This will automatically trigger the "don't tag and reroll" mode.

-K
