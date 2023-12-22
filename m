Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61912C19C
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n1CUM/co"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274D6C433C7;
	Fri, 22 Dec 2023 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1703270416;
	bh=p3u0UAtxcx1Zgokcm+GObQJtwf6zYs8vzIuEkJrBQZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1CUM/covT0K9jME2tCfUmyLbbm2qx513GWhulOasxvlye5GZmKNoxnZWrTISTULp
	 dLzsuRC8iQyRi8kiw05N7Aoixb/tDOhqd/2/4ODtTdK5YJXibLaum+YDJv+6OTTkKD
	 1ydK/QwcjLpOLM15/MyiwcYOulD+XMBoLZcQesAk=
Date: Fri, 22 Dec 2023 13:40:15 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH RESEND v4 0/3] livepatch: Move modules to selftests and
 add a new test
Message-ID: <20231222-horned-caiman-of-freedom-3fec0a@lemur>
References: <20231220-send-lp-kselftests-v4-0-3458ec1b1a38@suse.com>
 <55b717dba239f3bedf0da7e25925e390a63459f5.camel@suse.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55b717dba239f3bedf0da7e25925e390a63459f5.camel@suse.com>

On Thu, Dec 21, 2023 at 09:17:04AM -0300, Marcos Paulo de Souza wrote:
> To clarify: this is not a resend, this is the v4 that people were
> waiting for. I made a mistake with b4 tool, that first I sent the email
> just to myself, for testing, and it bumped the version to v5, but I
> asked it to "resend" the v4, but it ended up adding the "RESEND" to the
> series.

Thank you for sharing that. The expected workflow here would be to use
--reflect first if you wanted to send something to yourself. Can you think of
a way that this experience can be less unexpected?

(Dropping everyone else from cc's and adding the tools list)

-K
