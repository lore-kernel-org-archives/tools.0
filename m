Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB02D1229D
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 19:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BBQ4lyFCj9mTHE6H8IDIMsXXbk1h2Fy5GUSjxGpYJkc=; b=MU9/qtF1r9lpD6kMEEbma/z66C
	StRZFMLnRPlFb5mnVz1j91Fyf2o5FXWBpGTkBntk9elOp9GHar8POtxBCGHOeHOCLqgwoYkS7feMN
	JO73/8YRhSik0EYbn64R/a8DvLeyGJhmb0l5Sm/qMcu5dgcJIMlUmijuPlIwQHNZ920OVA/ufH4oj
	Xqa8C+Ine8ESEreHy2RffQv4iQdZYCuvPctcpLs551fKVLE4bGJ+ucRNKIqsKaDBJW1WOgs5GV/WM
	Dk1h3K4cPog46Tn6duN4C0VPo6o1EDnt6vZX5acTxB1bbL+0Ql6QkqFX1fTlSbkqGUSH5WoNlzkE+
	VLWBXRhA==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=59108)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oxZFt-0004ov-Mx; Tue, 22 Nov 2022 20:48:29 +0100
Message-ID: <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
Date: Tue, 22 Nov 2022 20:48:27 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly smtp
 provider anyone?)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
 <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 22.11.2022 20.44, skrev Konstantin Ryabitsev:
> (Dropping everyone from cc's and adding the tools list.)
> 
> On Tue, Nov 22, 2022 at 08:22:22PM +0100, Noralf Trønnes wrote:
>>> Yes. There will be a 0.10.2 in the near future, but the incoming fixes
>>> shouldn't make much difference for the b4 send code.
>>>
>>
>> This is what I got:
>>
>> $ b4 send --web-auth-verify <challenge string from email>
>> Signing challenge
>> Submitting verification to https://lkml.kernel.org/_b4_submit
>> Traceback (most recent call last):
>>   File "/home/pi/.local/lib/python3.10/site-packages/b4/ez.py", line 188, in auth_verify
>>     res = ses.post(endpoint, json=req)
>> ...
>> TypeError: Object of type bytes is not JSON serializable
> 
> This is very strange, because this is literally the code in question:
> 
>     req = {
>         'action': 'auth-verify',
>         'msg': bdata.encode(),
>     }
>     logger.info('Submitting verification to %s', endpoint)
>     ses = b4.get_requests_session()
>     res = ses.post(endpoint, json=req)
> 
> I don't see where "Object of type bytes" would come from. Can you possibly
> insert the following above the `res = ses.post` line:
> 
>     logger.debug('endpoint=%s, req=%s', endpoint, req)
> 

$ b4 -d send --web-auth-verify <challenge>
Running git --no-pager rev-parse --show-toplevel
Running git --no-pager config -z --get-regexp b4\..*
Running git --no-pager config -z --get-regexp gpg\..*
Running git --no-pager config -z --get-regexp user\..*
Signing challenge
Submitting verification to https://lkml.kernel.org/_b4_submit
endpoint=https://lkml.kernel.org/_b4_submit, req={'action':
'auth-verify', 'msg': b'From: noralf@tronnes.org\nSubject:
b4-send-verify\nX-Developer-Signature: v=1; a=ed25519-sha256;
t=1669146435; l=45;\n i=noralf@tronnes.org; s=20221122;
h=from:subject;\n bh=E4BgU7G2i7CeIkR8F1AfDTtOvDBQA7ld22s0U29/H84=;\n
b=eRcDEBQvE702NSqEWQDLRyp9emSRvBjdhIW1c8e65OPf9Z1h78HB8UVqwWpf21mBSBtO8ZsLzPkg\n
L5w0Y/ekCLtNWAVqAjRGRASBZKkcbWnQ/CWLAHmzbHskL1tiwgMv\nX-Developer-Key:
i=noralf@tronnes.org; a=ed25519;\n
pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=\n\nverify:7ad470b4-f531-4632-8093-738d4d3e5d88\n'}
Traceback (most recent call last):
  File "/home/pi/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
  File "/home/pi/.local/lib/python3.10/site-packages/b4/command.py",
line 341, in cmd
    cmdargs.func(cmdargs)
  File "/home/pi/.local/lib/python3.10/site-packages/b4/command.py",
line 86, in cmd_send
    b4.ez.cmd_send(cmdargs)
  File "/home/pi/.local/lib/python3.10/site-packages/b4/ez.py", line
1103, in cmd_send
    auth_verify(cmdargs)
  File "/home/pi/.local/lib/python3.10/site-packages/b4/ez.py", line
189, in auth_verify
    res = ses.post(endpoint, json=req)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 590,
in post
    return self.request('POST', url, data=data, json=json, **kwargs)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 528,
in request
    prep = self.prepare_request(req)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 456,
in prepare_request
    p.prepare(
  File "/usr/lib/python3/dist-packages/requests/models.py", line 319, in
prepare
    self.prepare_body(data, files, json)
  File "/usr/lib/python3/dist-packages/requests/models.py", line 469, in
prepare_body
    body = complexjson.dumps(json)
  File "/usr/lib/python3.10/json/__init__.py", line 231, in dumps
    return _default_encoder.encode(obj)
  File "/usr/lib/python3.10/json/encoder.py", line 199, in encode
    chunks = self.iterencode(o, _one_shot=True)
  File "/usr/lib/python3.10/json/encoder.py", line 257, in iterencode
    return _iterencode(o, 0)
  File "/usr/lib/python3.10/json/encoder.py", line 179, in default
    raise TypeError(f'Object of type {o.__class__.__name__} '
TypeError: Object of type bytes is not JSON serializable

Noralf.

