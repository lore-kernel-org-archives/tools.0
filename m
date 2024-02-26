Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC0612C7FC
	for <tools@linux.kernel.org>; Mon, 26 Feb 2024 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966024; cv=none; b=c8E6HC9xDjpsbwrHWQV2EgDZxXGIGtg+x+apALb602mDaz7QSriLD/LsZvwWEoUWC0CS87Bf60hE9KNtpHHQLCMXcqtKUpoMiaIxCURWyxwp/uzrvnwXD6QtcN+IhikIv65gI/QSBSwNtrWpbYyTBDesekvabr1cBmmPQfPTbUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966024; c=relaxed/simple;
	bh=wZ615YGigRNPXYL4cBF4bFPo4jEW09ebTPbuJm9O6uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRXJ87r7oFNtrCuv9GifqcFSw0MDkVH6dLDuR8R88mWKOgMfV+pMPIfVAJvSRVAeuKLw8w0oic6MjIYHf1SmJLYflDHCyOTWK7h3Rfb2IIxCPdgop0DUI9p0wEh3ErgH79yNNYpHYmDoEPISEqlc7fiXz0gDlBdaVNd/KG33iFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=saZACVo5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=E9b143P9; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=saZACVo5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=E9b143P9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="saZACVo5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="E9b143P9";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="saZACVo5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="E9b143P9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 595641FB5E;
	Mon, 26 Feb 2024 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1708966017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iX8CuimktiIkX04Ql0cGTjEPY3t5syJrfctp5cUbt2w=;
	b=saZACVo5GAr4FNk+g6J1ccSxVDAueka2jqkfc83llA6sRlbYU6yxOaL1u4666n8L+203cS
	2PdmfVJnKk8G6feJmzePmP5v3WZ9/YvdGDX3w2N2Qr4fC4lxVb++o9pLZA0XFmTAe6a088
	tVeCIb8nKcM7TEfx/BZX8VHjFeRwcCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1708966017;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iX8CuimktiIkX04Ql0cGTjEPY3t5syJrfctp5cUbt2w=;
	b=E9b143P9PbNFrZq2ITuJVxyXS9hbCnWYCspAQpzTPeIcvhHRjGlGlAFpjPKXqv3BfivWVk
	cyMJEXlTyN4VeyBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1708966017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iX8CuimktiIkX04Ql0cGTjEPY3t5syJrfctp5cUbt2w=;
	b=saZACVo5GAr4FNk+g6J1ccSxVDAueka2jqkfc83llA6sRlbYU6yxOaL1u4666n8L+203cS
	2PdmfVJnKk8G6feJmzePmP5v3WZ9/YvdGDX3w2N2Qr4fC4lxVb++o9pLZA0XFmTAe6a088
	tVeCIb8nKcM7TEfx/BZX8VHjFeRwcCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1708966017;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iX8CuimktiIkX04Ql0cGTjEPY3t5syJrfctp5cUbt2w=;
	b=E9b143P9PbNFrZq2ITuJVxyXS9hbCnWYCspAQpzTPeIcvhHRjGlGlAFpjPKXqv3BfivWVk
	cyMJEXlTyN4VeyBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28C9C13A58;
	Mon, 26 Feb 2024 16:46:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sAXtB4HA3GWrFAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 26 Feb 2024 16:46:57 +0000
Message-ID: <41eedcc8-d186-4bab-976f-e92c05e1b488@suse.cz>
Date: Mon, 26 Feb 2024 17:46:57 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 using specified base-commit yet still fails to apply?
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <82bdf374-b96e-4cc8-995b-addfbab91dec@suse.cz>
 <20240226-industrious-meticulous-jaguar-bdacbc@meerkat>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20240226-industrious-meticulous-jaguar-bdacbc@meerkat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=saZACVo5;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=E9b143P9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.80 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 TO_DN_SOME(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.cz:+];
	 RCPT_COUNT_TWO(0.00)[2];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 SUBJECT_ENDS_QUESTION(1.00)[];
	 BAYES_HAM(-0.30)[75.00%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -0.80
X-Rspamd-Queue-Id: 595641FB5E
X-Spam-Flag: NO

On 2/26/24 16:49, Konstantin Ryabitsev wrote:
> On Mon, Feb 26, 2024 at 03:34:40PM +0100, Vlastimil Babka wrote:
>> Hi,
>> 
>> When I do:
>> 
>> git checkout v6.8-rc1
>> 
>> b4 shazam https://lore.kernel.org/all/20240221194052.927623-1-surenb@google.com/
>> 
>> I can see it detects the base commit (which is v6.8-rc5+)
>> 
>>  Base: using specified base-commit 39133352cbed6626956d38ed72012f49b0421e7b
>> 
>> but eventually fails to apply something:
>> 
>> Applying: mm: create new codetag references during page splitting
>> Patch failed at 0019 mm: create new codetag references during page splitting
>> 
>> If I do first
>> 
>> git checkout 39133352cbed6626956d38ed72012f49b0421e7b
>> 
>> then it applies cleanly. Is the base-commit handling buggy?
> 
> No, this is expected behaviour -- the bug is that we write out the "using
> specified base-commit" line. By default, "shazam" will attempt to apply the
> series directly on top of your current tree, and so the base-commit doesn't
> really matter directly [*].

Makes sense.

> What you probably wanted to do was "b4 shazam -M" or "b4 shazam -H".

-H works for my case (reviewing series), probably not necessary to add some
option that would reset to the base first. I can work with the resulting
FETCH_HEAD. Thanks!

> [*] that said, when we do have base-commit info, we can try to do a 3-way
> merge instead, which we don't currently do. I'll make a note of this.

Sounds good.

> -K

