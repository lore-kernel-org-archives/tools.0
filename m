Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B64C3C5
	for <tools@linux.kernel.org>; Thu, 14 Dec 2023 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="GX72/+q2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="v9NMBxnb";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rZ29RoHJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nfc2OKPf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ECB1222164;
	Thu, 14 Dec 2023 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702557200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dd5+fZsGc09KOziZNuvk9w349Rg0L6n1q+WYaZjcNi4=;
	b=GX72/+q20b06BPeIV3n3rdHRTjG8mRojxfvA0VJPwmCVVwVkArYUHeg3U5fVNEy75CmlL0
	hAtdOAPR5QQBD1c9q0Ta3WY2MsK5iYaaEAhnOgve2SsDulIxzXkew6MpU3TfrNj7Lw7ceU
	UJYT5vq6DPZJEhJ8+CfQHPAgM76l5bM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702557200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dd5+fZsGc09KOziZNuvk9w349Rg0L6n1q+WYaZjcNi4=;
	b=v9NMBxnbOoZ84cOHw8vjsw6Wtsc2P+P8ubpEKs++VOMn68xFh4z/gUOD2jm1hzWTp1ArDQ
	wrh/q1uI9puy6tCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702557199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dd5+fZsGc09KOziZNuvk9w349Rg0L6n1q+WYaZjcNi4=;
	b=rZ29RoHJPDfYLko98Nk2hqItu2wAaeqorOtBagQfYnL2WhW4LzwBCg8azd0IgztqXpPqbO
	MwE2wyb6qTHdFVC1tUUAfUJMEyq3AvM82nRlz1r1usk0dkVHCgfyXkrTu8NOVB6pbR//Yz
	aPZeA7kzfnoaXz+y19D2VQ1OmcJSenE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702557199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dd5+fZsGc09KOziZNuvk9w349Rg0L6n1q+WYaZjcNi4=;
	b=nfc2OKPf5kPPGmGslb2PlI2e174Dby/ZzMH96Cp1tSWKdsw+m09SQcGhTIPzoN8OqIb1LU
	tFDzSY9/7DvYHJCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D08C51379A;
	Thu, 14 Dec 2023 12:33:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VvzkMA/2emWUAQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 14 Dec 2023 12:33:19 +0000
Message-ID: <8c99d7e8-c389-a4f6-efcc-b36f884cb784@suse.cz>
Date: Thu, 14 Dec 2023 13:33:22 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: b4 send suggestion: handle .git_aliases
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <34582e34-5b62-ab86-682d-dac555e90330@suse.cz>
 <20231212-illustrious-lion-of-psychology-d85d9d@meerkat>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20231212-illustrious-lion-of-psychology-d85d9d@meerkat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: ****
X-Spamd-Bar: ++++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=rZ29RoHJ;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=nfc2OKPf;
	dmarc=none;
	spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:97 is neither permitted nor denied by domain of vbabka@suse.cz) smtp.mailfrom=vbabka@suse.cz
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [4.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 BAYES_HAM(-0.00)[17.05%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(1.20)[suse.cz];
	 R_SPF_SOFTFAIL(4.60)[~all:c];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.cz:+];
	 RCPT_COUNT_TWO(0.00)[2];
	 MX_GOOD(-0.01)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.18)[-0.914];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: 4.31
X-Rspamd-Queue-Id: ECB1222164
X-Spam-Flag: NO



On 12/12/23 20:41, Konstantin Ryabitsev wrote:
> On Tue, Dec 12, 2023 at 06:27:50PM +0100, Vlastimil Babka wrote:
>> It would be nice if b4 send --to/cc used .git_aliases
> 
> I recall looking at that before, but it's non-trivial. There are 6 different
> formats the aliases file can be in:
> 
>        sendemail.aliasesFile
>            To avoid typing long email addresses, point this to one or more email aliases files. You must
>            also supply sendemail.aliasFileType.
> 
>        sendemail.aliasFileType
>            Format of the file(s) specified in sendemail.aliasesFile. Must be one of mutt, mailrc, pine,
>            elm, gnus, or sendmail.
> 
> There is git-send-email --dump-aliases, but, unhelpfully, it will only dump
> the shortnames, not the destinations.

That's unhelpful to the point I wonder why the option was even
implemented :)

> I don't have a good solution in my head right now other than creating fake
> patches, passing them to git-send-email with -to on the CLI and then parsing
> what we get out of it. Which is horrible, but is about just as horrible as
> creating a parser for 6 different file formats.

Understood.

>> and also if something malformed is given to it (such as an alias it doesn't
>> handle now), warn instead of just dropping it silently.
> 
> That part at least I can handle properly.

Aha, and also just noticed that given multiple --cc parameters b4 only
takes the last one and not add them up (--to probably the same).
Although --help documents it as such, it seems an unnecessary gotcha for
somebody used to git send-email.

Thanks,
Vlastimil

> -K
