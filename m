Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D96013A276
	for <tools@linux.kernel.org>; Wed,  6 Mar 2024 17:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709744698; cv=none; b=CcrBXpkiznuh2/rR0ENyhAXLkIJiGc0u8coW/oGQr/iW2nvM6bphQuhDG7R72rhOvkApfTUCqh72lxAw5ZjE7bCziBSSq8uPZQMJYH8XKD357BePLH8KspPS7rTePTBT0qV+9sb+1ScCgZKouxcZ+sDuvD2Nn3PShUTHAvFH3hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709744698; c=relaxed/simple;
	bh=tySBHjWQX2GCnSyc82CqY14zOSjy/jDYwOGGCoXTpWs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=cpVuKcBI4EgEOD/fKsOp1YMSV91sERXWDHXGRaA4s7hyFNDngfVRNkDgPlDMe4kWiebF8L4Gh6sEWFjEH8e3TaXn14XBya4Q/bJs+G2Whk6MmdNrMd1G4WO1TZfrDwZbjEXUGcLKveWynqpvgr1nyu5wwIF7F7TP8+j4cJIgVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=QZHt+ASS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="QZHt+ASS"
Received: by smtp.kernel.org (Postfix)
	id BDF7FC43399; Wed,  6 Mar 2024 17:04:57 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E477CC433F1
	for <tools@kernel.org>; Wed,  6 Mar 2024 17:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E477CC433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5a17274193eso651092eaf.3
        for <tools@kernel.org>; Wed, 06 Mar 2024 09:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709744694; x=1710349494; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:content-language
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tySBHjWQX2GCnSyc82CqY14zOSjy/jDYwOGGCoXTpWs=;
        b=QZHt+ASSzJbH+iqnOo7nW150z8WTZIU43nGhP+V2dSwO3fsnWeYL5if5dP/9H3F+qm
         o/PP0YeOcv4foAFE/IHkRPxr32av+eHy+j9Ant+iu+nCGCq4i7tRbcYRof2KKsTvH64H
         obe9PyPcXy+kla72n0bmwO2y7rHMURnIhiKPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709744694; x=1710349494;
        h=content-transfer-encoding:autocrypt:subject:from:content-language
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tySBHjWQX2GCnSyc82CqY14zOSjy/jDYwOGGCoXTpWs=;
        b=rhZuV9pOLl/2XxcV1ypdy1tahKX43DHFdrlfCIgdorXE35elViE4lQeQT+HkAoV7rV
         vgUCIdWX4bAVkVbv1IsO331VDbETjLxm1eGndeTMm2MexeOdhCQ9Ll5onbxkKA3HE/HU
         BCzoIsKV5iv620v1SArCJ0YvlWWlmB+nNyXJZTGL7fdCPKBjcl5Yv5UK/tIUSSfndZnI
         /uTe+Lb+JqWE0+jxKJzYUWrgFIMo18/tnddbaChDPS7Cc7a/xt8Teg4QM1xd67VZbs+m
         rRhO+LBw9AJDW5DWaV7B0X+cO35yuisnsoX21QXFzKA0qjA9jInePmQgjdVthXtJzT2P
         ZhVQ==
X-Gm-Message-State: AOJu0YwyxKXaIwQny3QQKIoQzylgfGYE6fV/vs/9WxkZgmvt0VgFqbht
	aoVyKyB3J8Glmlr/e8gu34dZcun0+Qv2NaueNC7wkeOhAKuklF5b5/0X2M5NwAk6WBDqrfMlm2F
	6
X-Google-Smtp-Source: AGHT+IGybHM1kPo9zlvDaFNBQ5Z+oTAA+BERBA9f4SjTAb2b7LgflM8WlxaBtcEk3My+5rT4JOWlXA==
X-Received: by 2002:a05:6358:6f0e:b0:17c:1da1:aa8f with SMTP id r14-20020a0563586f0e00b0017c1da1aa8fmr5783531rwn.24.1709744694623;
        Wed, 06 Mar 2024 09:04:54 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id b6-20020ac86786000000b0042f09265a34sm1233537qtp.91.2024.03.06.09.04.53
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 09:04:53 -0800 (PST)
Message-ID: <16beccd0-db0b-4c9c-a4d1-fcf43f98959c@citrix.com>
Date: Wed, 6 Mar 2024 17:04:51 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: tools@kernel.org
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: b4 DKIM checks
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[Summary of an IRC debugging session, as requested]

b4 DKIM checks on my own patches fail.

It worked fine for Konstantin, and it turns out to be because of
differing TXT record visibility inside and outside of the corporate notwork.

~Andrew
