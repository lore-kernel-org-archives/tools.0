Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A29156F9
	for <tools@linux.kernel.org>; Tue, 17 Oct 2023 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="t8OIREF+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="31qwHJbT"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 689B01FF09;
	Tue, 17 Oct 2023 07:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1697526572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfdGDz5sbSfm+NKtiTUIOJ5i9n31kxybK7PYcJZoFQo=;
	b=t8OIREF+1rn/uhxpze6plAQVagj/iChv8p0HS19/xzfrJZpCBDv22ZWmoiLHp0Thm8F9iu
	ggQ7KV+kNrzUxCpj81g37wb2HG6s6a0RBYGfUlTytvjfoEyc98wbZZWXWyiI4MriycPMCl
	9SfBAqMNWtnUbYsWLidajk0bJXF7gAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1697526572;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfdGDz5sbSfm+NKtiTUIOJ5i9n31kxybK7PYcJZoFQo=;
	b=31qwHJbT2pKKb0BBwDYzh+8i8Dgd8nb2vYAdVqngLRvAxXfcj/GrGIfhbbU8//yQkb0VAi
	J4OWLtWohTFY66AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54C0213584;
	Tue, 17 Oct 2023 07:09:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PIDwEywzLmVaIAAAMHmgww
	(envelope-from <vbabka@suse.cz>); Tue, 17 Oct 2023 07:09:32 +0000
Message-ID: <8dcf734d-1fca-a8e2-394b-22c31e8d8e0d@suse.cz>
Date: Tue, 17 Oct 2023 09:09:31 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: "b4 am" quotes parens in S-o-b lines
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>,
 "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: konstantin@linuxfoundation.org, tools@linux.kernel.org
References: <ZS2RA6G07+/eYu8C@casper.infradead.org>
 <20231016-b218017c2-ccc058da10b3@bugzilla.kernel.org>
 <ZS35gUsmJq4aWgm3@casper.infradead.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <ZS35gUsmJq4aWgm3@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.43
X-Spamd-Result: default: False [-4.43 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.33)[75.98%];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 10/17/23 05:03, Matthew Wilcox wrote:
> On Mon, Oct 16, 2023 at 08:35:22PM +0000, Kernel.org Bugbot wrote:
>> Konstantin Ryabitsev writes in commit 26615095533f901d9cbf9eb599f4dc5e305f5036:
>> 
>> trailers: do not quote names when special chars are present
>> 
>> When fixing potential email address rendering problems, we do not need
>> to be as stringent about the contents of the git trailer as when we are
>> dealing with actual email headers. For example, we do not need to quote
>> names containing things like commas or parentheses.
>> 
>> Reported-by: Matthew Wilcox <willy@infradead.org>
> 
> Surely that should be ...
> 
> Reported-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Don't you mean:

Reported-by: "Matthew Wilcox (Oracle)" <willy@infradead.org>

/me hides

> 
> ;-)
> 
> Thanks for the quick fix!
> 

