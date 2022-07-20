Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B87748C;
	Wed, 20 Jul 2022 23:16:12 +0000 (UTC)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id BC9D31A36E0;
	Wed, 20 Jul 2022 19:13:28 -0400 (EDT)
	(envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:references:date:in-reply-to:message-id:mime-version
	:content-type; s=sasl; bh=gHMjsKZn4q818mPwdrKf5N9HyNoTHolZDzYwZO
	XTHwY=; b=hw52+nPYRQjo9vIEtqFj2V48GJB3XR/EHkd+1bZnxlX+RG/VYy0m4/
	8HiLz1+nBvw6BLLyXrEF4+0sLixVF5HyysC0MT4hY/TK38Snn1oeX47vXdyTBayB
	75e+NtU2XzJSZVme76fS/xVKkNT4EVu2S09FxJaAyHgBwAzX6CH+c=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id A6DD81A36DF;
	Wed, 20 Jul 2022 19:13:28 -0400 (EDT)
	(envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 326DE1A36DD;
	Wed, 20 Jul 2022 19:13:25 -0400 (EDT)
	(envelope-from junio@pobox.com)
From: Junio C Hamano <gitster@pobox.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
  users@linux.kernel.org,  tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
	<20220720184835.uhnkucai54alhgo6@nitro.local>
	<20220720192456.GM5049@ziepe.ca>
Date: Wed, 20 Jul 2022 16:13:23 -0700
In-Reply-To: <20220720192456.GM5049@ziepe.ca> (Jason Gunthorpe's message of
	"Wed, 20 Jul 2022 16:24:56 -0300")
Message-ID: <xmqqmtd31ip8.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID:
 8E758C38-0881-11ED-992D-CBA7845BAAA9-77302942!pb-smtp21.pobox.com

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Wed, Jul 20, 2022 at 02:48:35PM -0400, Konstantin Ryabitsev wrote:
>> Hello, all:
>> 
>> Based on your feedback, I've refactored the submit functionality and it's
>> ready for some more poking and testing. Here are the implemented changes:
>> 
>> 1. Pluggable cover letter strategies
>>    The goal is to support 3 different cover-letter strategies:
>> 
>>    "commit": same as first implementation with the cover letter stored in an
>>    empty commit at the beginning of the series.
>
> How about an 'end of the series' option if we are doing lots of
> choices?
>
> I've never actually seen 'start of the series' in the wild before..

FWIW, I was planning to do a new feature for 

 - "git am", where the cover letter becomes an empty commit at the
   tip of the series; and

 - "git merge", where such a branch with an empty commit that stores
   the overall topic description at the tip of it would lose the tip
   commit when the topic is merged, and instead the resulting merge
   message would inherit the message from the empty commit at the tip.

 - "git format-patch", where such an empty commit at the tip is
   recognised and is used to pre-populate the cover letter.

And having cover letter consistently at the top of the series would
make the life easier, I would imagine.

Thanks.

