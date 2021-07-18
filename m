Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFB872;
	Sun, 18 Jul 2021 04:34:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1626582867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfAQwjE1i4cI1TFi67MEsOf1Qfd73Gck/euBgqVlSdw=;
	b=Yh9+FiXO5qYBS+vMdDwOE0TpM+Z3e5AQGBV9uQFRJjWHo8mtV/ZR3x/nCM1QflKfmFCCgC
	sGaolpowvNUPMv767QwPOCqbXdkbAmNe94EM6wASbgcoyKusMn6HLVGWZf3DoIdON/1w1Q
	L+CI8PDdLFzZB4hgIRpg+BLI1I0YSxprfO0bViiUR3PNIyCO3HunvHZCsRCP9PIWFPA9ug
	dNSl5wC97zeSsE5uc3QP7eghMeh6FxDy5nGhayMRDV6m6k1cf/rJ2p+RJwg+iIUqsAOJbq
	uhQ7Jr0r1JXWH7ue4X3kVC4Mghk8mZ0fQdJHwE+sABiQ2cwRjbjrnFDmRu6urg==
From: Kyle Meyer <kyle@kyleam.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org,
	users@linux.kernel.org
Subject: [PATCH b4 0/2] Avoid decoding errors when extracting message ID from stdin
Date: Sun, 18 Jul 2021 00:34:04 -0400
Message-Id: <20210718043406.26727-1-kyle@kyleam.com>
In-Reply-To: <20210717212631-mutt-send-email-mst@kernel.org>
References: <20210717212631-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

Michael S. Tsirkin writes:

> On Sat, Jul 17, 2021 at 05:21:30PM -0400, Kyle Meyer wrote:
>> Michael S. Tsirkin writes:
>> 
>> > Passing message id
>> > bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com to b4
>> > gives this backtrace:
>> >
>> > Traceback (most recent call last):
>> > [....]
>> >   File "/scm/b4/b4/__init__.py", line 2072, in get_msgid_from_stdin
>> >     message = email.message_from_string(sys.stdin.read())
>> >   File "/usr/lib64/python3.9/codecs.py", line 322, in decode
>> >     (result, consumed) = self._buffer_decode(data, self.errors, final)
>> > UnicodeDecodeError: 'utf-8' codec can't decode byte 0xd4 in position 5886: invalid continuation byte
>> >
>> > mutt does not seem to have trouble decoding this ... weird.
>> 
>> I'm confused by that backtrace.  I think get_msgid_from_stdin() should
>> be called only when a message is fed on stdin.  You say you're passing a
>> message ID.  That's as a positional argument, right?
>
> Sorry. I passed the message on the stdin. I supplied the
> message ID so you can get the original from the list archives.
>
> To reproduce:
>
> wget -O - https://lore.kernel.org/lkml/bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com/raw | b4 mbox

Thanks.  I can trigger that on my end too.  Here's a possible fix.
The first patch is the actual fix.  The second patch makes this code
path do a little less work but isn't necessary.

  [1/2] Avoid decoding errors when extracting message ID from stdin
  [2/2] Parse just headers when extracting message ID from stdin mbox

 b4/__init__.py | 4 +++-
 b4/pr.py       | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)


base-commit: 06cc7c8820aea85d1329911b785d7bf4ecaacb1f
-- 
2.32.0

