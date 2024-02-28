Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3042F15AADD
	for <tools@linux.kernel.org>; Wed, 28 Feb 2024 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709132673; cv=none; b=hqmh7bnlnBBF90ciSM39smR+uJmpuzcNUNsRozMgl50go8c518I8HSatrULZoOYWfAHrln7iu8QOwUJuIe0nO2WsXU7jUjAR7wAFh1t+lNaYqyJevK0rvNaNdtHwmUqpqOe5ETwFDqVE3O3UAsNH1GqUkYwPmxoPvefs2KXIr6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709132673; c=relaxed/simple;
	bh=ICf3llRhKzsde8fo1Q1aB7wG5OV0TqvKVUddOkNSgoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilpMXujLS6VOzTRSx+1OyTUpVOTa+OgyS/hvISLAm/nvJhkjpLfsg7mCrhkHQeq6K93cTWxH6afnYC1eZIM9bfEgTFj3ycxklspohpl1CxHVEn6d8AG3uACQnusgB+rm+X7HWUksWRMimn3rA84sCwaspsgIi68cBmmJvsNid9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=igmAQ0Mb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+cZUl0Z2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=igmAQ0Mb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+cZUl0Z2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="igmAQ0Mb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+cZUl0Z2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="igmAQ0Mb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+cZUl0Z2"
Received: by smtp.kernel.org (Postfix)
	id DE705C43394; Wed, 28 Feb 2024 15:04:32 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 970E7C433C7;
	Wed, 28 Feb 2024 15:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 970E7C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 91F471F453;
	Wed, 28 Feb 2024 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709132668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qASRpUOVMS/5k5XRNi4h7PRFq0+PnsnP5rwRnU/rHuY=;
	b=igmAQ0MbXmbbHoV/9jR38VbshsQkSL/YwcGbmwSwqW73s8xQhfhUwX9lwz8NfmdC7LfhrY
	4LCMZoOupmF5UneKPqNUjn9rsTGPKaIxSHIUXlSZc4V2t36ryxP5U/HOn/pgjz/y2uH9sj
	FIkZHYPB/nOSpUXkwVL83zNv4pN+iYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709132668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qASRpUOVMS/5k5XRNi4h7PRFq0+PnsnP5rwRnU/rHuY=;
	b=+cZUl0Z2bDdkI75VDjimD/BZGHw/O9C+8qU7QzIO0lBzlrgSgh+banpe6eCfipwl+46GK8
	pWD4UYbCfl+9M9BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709132668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qASRpUOVMS/5k5XRNi4h7PRFq0+PnsnP5rwRnU/rHuY=;
	b=igmAQ0MbXmbbHoV/9jR38VbshsQkSL/YwcGbmwSwqW73s8xQhfhUwX9lwz8NfmdC7LfhrY
	4LCMZoOupmF5UneKPqNUjn9rsTGPKaIxSHIUXlSZc4V2t36ryxP5U/HOn/pgjz/y2uH9sj
	FIkZHYPB/nOSpUXkwVL83zNv4pN+iYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709132668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qASRpUOVMS/5k5XRNi4h7PRFq0+PnsnP5rwRnU/rHuY=;
	b=+cZUl0Z2bDdkI75VDjimD/BZGHw/O9C+8qU7QzIO0lBzlrgSgh+banpe6eCfipwl+46GK8
	pWD4UYbCfl+9M9BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D1E013A58;
	Wed, 28 Feb 2024 15:04:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2XkXHnxL32W0fQAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 28 Feb 2024 15:04:28 +0000
Message-ID: <4fa1cbc7-0f9d-47bf-8ff7-a9b17456431e@suse.de>
Date: Wed, 28 Feb 2024 16:04:28 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Content-Language: en-US
To: Willy Tarreau <w@1wt.eu>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org,
 Jon Corbet <corbet@lwn.net>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240228050007.GB18047@1wt.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.09 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.00)[39.38%];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.09

On 2/28/24 06:00, Willy Tarreau wrote:
> Hi Konstantin,
> 
[ .. ]
> And because of this I didn't find on what boundaries to cut the analysis,
> If it's "since last time I read my email", it can only be done locally
> and will be per-user. If it's a summary of a final thread, it's not
> super interesting and it's better explained (IMHO) on LWN where the
> hot topics are summarized and developed. If it's the list of threads
> of the day, I've suspected that there are so many that it's unlikely
> I'd read all of them every evening or every morning. I've been wondering
> if an interesting approach would be to only summarize long threads,
> since most short ones are a patch, a review and an ACK and do not need
> to be summarized, but I think that most of us seeing a subject repeat
> over many e-mails will just look at a few exchanges there to get an
> idea of what's going on.
> 
[ snip ]

Out of personal interest I really have to chime in here.
You are aware, though, that following this line of thought
and improving the underlying model (which really shouldn't
be too hard given the vast body of training data which is LKML)
we will actually putting LWN and its editors out of business.

I would be _VERY_ interesting having a discussion here with the
relevant parties (Hello Jon!) to see which direction we as a
community will want to go. Maybe Plumbers and/or Kernel Summit in Vienna 
would be a good place to start.

Cheers,

Hannes

