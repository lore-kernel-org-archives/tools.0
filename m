Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BCD19ABD8
	for <tools@linux.kernel.org>; Tue,  1 Oct 2024 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771219; cv=none; b=G4sZVXtUDH2eYU9QL99ORS6JiNeSHmQlbQYbOvv9TjJWqWavAZliLM1J7J5fu4CFmhBugz9/2VKL09tSD3qgCIsbS05S24d81KS3pKFX60CpZCbgU5lVoMmCsDag6l6OAQUE0TUtCpWXCwe7X8R7fR9HjGrsiYoTFZXAmqqBhZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771219; c=relaxed/simple;
	bh=dZKqsnE8SeYG46zmreOGdU5TQ/EYytPZ+qm6/RDU/Gg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VYBCa14CtVple2NjuYu/EItN9go03pnxwojeMsUU0BrKnT4a7p6JLahkAbgpwpLAgz3GLn7eAft7qB3a2vUiDqrfKomlbxN1tJs/FlIRFjsqcyhna1bM4f24FZz1pV4Q7pWClm7EyYiRBbtXKin82JR8DhT1FNy8WVubxPz3yhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lX0pF4Vf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lX0pF4Vf"
Received: by smtp.kernel.org (Postfix)
	id 784E5C4CEC6; Tue,  1 Oct 2024 08:26:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A07CC4CECD
	for <tools@kernel.org>; Tue,  1 Oct 2024 08:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A07CC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727771216; x=1759307216;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=dZKqsnE8SeYG46zmreOGdU5TQ/EYytPZ+qm6/RDU/Gg=;
  b=lX0pF4VfhH1rZ0uvax5mXAVfY9QDg8w42nD9YJcgIUm0Yf3zo/k8DRF4
   EcXbY8ts9tHpSBMJSAqbB2nId/+Vwq5blmnAsuTp+ynIFi/KF/wkF2vmf
   XaUv9l9MFaLtVvv23MEwi3QXjrclFQqEnEZxfZInc5/7MZJ4KmLwTIrmK
   q2/0hsXhLdTlAXEjedjvLh0SYo/+S4RYRfFWlylAdrIirSocFtuvcs2Fp
   QZeurYlw73+d6Kd0StP4fkzCm5/4sJELWZe4Lixj2Waw9G5Wp2wAoyT1o
   QsaKzX+Qy4UycJzTFt2QUE5Yg4jFPjn2KUno/XHzFVrxFBCQabYB/3G92
   A==;
X-CSE-ConnectionGUID: SASmHC8BSDeYSPUOsnHsBA==
X-CSE-MsgGUID: hLbpZfTRR6ur6sffL2Bd9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30774123"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="30774123"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 01:26:29 -0700
X-CSE-ConnectionGUID: MF5jHQMPQaaCkQfVUVK51w==
X-CSE-MsgGUID: A3GpwWyZRb6tFaIh5ku0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78118083"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.188])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 01:26:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Gomez <da.gomez@samsung.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
In-Reply-To: <20240930211519.tquvjw7davr7zlfz@AALNPWDAGOMEZ1.aal.scsc.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-rustling-auburn-jaguar-23d200@lemur>
 <20240930143309.pwl7dzv537b2q3wk@AALNPWDAGOMEZ1.aal.scsc.local>
 <87h69xw68b.fsf@intel.com>
 <20240930211519.tquvjw7davr7zlfz@AALNPWDAGOMEZ1.aal.scsc.local>
Date: Tue, 01 Oct 2024 11:26:12 +0300
Message-ID: <875xqcw7ob.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 30 Sep 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
> On Mon, Sep 30, 2024 at 05:45:08PM +0300, Jani Nikula wrote:
>> On Mon, 30 Sep 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
>> > On Mon, Sep 30, 2024 at 10:20:57AM -0400, Konstantin Ryabitsev wrote:
>> >> On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
>> >> > > Was it an automated tool that sent you that message? Normally, email clients
>> >> > > would honour the "Reply-To" field and not use the From: address put in by the
>> >> > > relay.
>> >> > 
>> >> > It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
>> >> > Patchwork <patchwork@emeril.freedesktop.org>".
>> >> > 
>> >> > [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/
>> >> > 
>> >> > I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
>> >> > using the From field.
>> >> > 
>> >> > 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
>> >> > 	Reply-To: da.gomez@samsung.com
>> >> 
>> >> It's no big deal as long as you got the email response in the end. We expect
>> >> this to happen with a lot of automation, which is why any replies to the relay
>> >> address are auto-discarded.
>> >
>> > To clarify, the email response didn't land into my inbox. I realized a response
>> > was sent after checking at lore.kernel.org.
>> 
>> Yeah, our patchwork instance tries not to spam everyone, and limits the
>> replies to the submitter + intel-gfx/intel-xe mailing lists, but
>> apparently uses From instead of Reply-To.
>
> I've just realized that it also happened with 0-day here:
> https://lore.kernel.org/all/20240917-blktrace-algn-v1-1-9fb54b7b1dfa@samsung.com/#t
>
> The answer from 0-day went to the same wrong devnull B4 Relay address.
>
> And lore's git-send-email + mailto: Reply instruction section is using the wrong
> address as well. I'm not sure why is the Reply instructions [1] section using
> From instead of Reply-To?

It's just that email is hard. It seems to be surprisingly difficult to
follow the requirements of the relevant email RFCs to the letter, but
also just by following the requirements or even recommendations of the
RFCs won't give you the kind of interoperability you might expect.

For example:

- In all cases, the "From:" field SHOULD NOT contain any mailbox that
  does not belong to the author(s) of the message. [1]

- When a message is a reply to another message, the mailboxes of the
  authors of the original message (the mailboxes in the "From:" field)
  or mailboxes specified in the "Reply-To:" field (if it exists) MAY
  appear in the "To:" field of the reply since these would normally be
  the primary recipients of the reply. [2]

I assume b4 is not using your address in From: because it's very likely
to get the email classified as spam due to From: spoofing. Worse, it
might get kernel.org on spam sender lists.

Yet using Reply-To: in replies is completely optional. It's not required
or even recommended, it's optional.

I realize this does not really help you with the issue, but might help
you adjust your expectations...


BR,
Jani.


[1] https://datatracker.ietf.org/doc/html/rfc5322#section-3.6.2

[2] https://datatracker.ietf.org/doc/html/rfc5322#section-3.6.3


-- 
Jani Nikula, Intel
