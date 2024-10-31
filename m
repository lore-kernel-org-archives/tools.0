Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968ED1BDA99
	for <tools@linux.kernel.org>; Thu, 31 Oct 2024 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730393995; cv=none; b=ZYT6NAG6RgQ3Kz6LWTcpDNrANQv8iRYn1C1mwsxmB3lj/3BqfOz0LtMpTK7Fb1r1mn1CvVXUWqBBjyUeEicmL5pPW49mcxCIrlxdMV1Mu/TcrJEiKLRwR1BlsAPpZyzI9sl9yupXMeK+Lyk+6HrqEQyLoPnkHWrnIGN+6Aey0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730393995; c=relaxed/simple;
	bh=ziqazX7R1ALU97Qy/KZKy3rMXjURkx3GsLiIX3Vw8tM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=j8W0IANgHd1bXSMI2aIeT9FWlZMpcWtpjTKYI4l1dOWpPPwKtsRwkk7piR0cG7vmt2JaBECBOwSND6JHQmy/rZCkhhcY/8rkyNxKFGhxdNdMDEEAWdAO7r6YPhos+KU67/E47vy2hvDSosVi8QrvObcpAJIcPUoRAvly9yYtSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EE7C4AF63;
	Thu, 31 Oct 2024 16:59:54 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------MBI0sIJwIEG4lkk0T7lel4K5"
Message-ID: <50a4abd8-eee7-400b-843b-24e0aca4a63e@xs4all.nl>
Date: Thu, 31 Oct 2024 17:59:52 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in b4 shazam?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Ricardo Ribalda <ribalda@google.com>
Cc: tools@linux.kernel.org
References: <CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com>
 <20241031-rich-caribou-of-superiority-61f832@lemur>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241031-rich-caribou-of-superiority-61f832@lemur>

This is a multi-part message in MIME format.
--------------MBI0sIJwIEG4lkk0T7lel4K5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2024 17:38, Konstantin Ryabitsev wrote:
> On Thu, Oct 31, 2024 at 03:06:56PM +0100, Ricardo Ribalda wrote:
>> Hi Konstantin
>>
>> Our CI bot has encounter some issues with this series:
>> 93d078e5-deba-4060-a32e-94bce677453c@xs4all.nl
>>
>> it complains that the patch is corrupted:
>> error: corrupt patch at line 27
>>
>> But it looks like b4 generated the corruption.
> 
> It's a bit more complicated. It looks like the patch was copy-pasted into
> Thunderbird, which is actually what introduced corruption. A well-formatted
> patch has no blank lines in it -- the line has to either start with "+", "-",
> or " ". If you view that commit with "git show --format=email", you will see
> that both lines between .. +v4l2-alpha-component: have a space character
> (replaced here with _ for clarity):
> 
>     +    necessary for hardware to work. This control is required for stateful
>     +    encoders.
>     _
>     _.. _v4l2-alpha-component:
>     _
> 
> However, when that patch was copy-pasted into Thunderbird, these blank spaces
> were trimmed so, strictly speaking, this is no longer a well-formatted patch.
> 
> That said, git deals with it correctly, so I'll see if we can recover from
> this corruption as well -- or at least not make it worse.

It is true that the patch was copy-and-pasted in Thunderbird.

However, the patch itself as formatted by 'git format-patch' *also* has no spaces.
I've attached the git format-patch output to this email.

So the patch as pasted in Thunderbird is consistent with what git format-patch
gave me.

I think completely empty lines are handled a bit differently by diff and do not need
a space at the beginning.

Regards,

	Hans

> 
> bugspray tag me
> 
> -K

--------------MBI0sIJwIEG4lkk0T7lel4K5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Documentation-media-improve-V4L2_CID_MIN_BUFFERS_FOR.patch"
Content-Disposition: attachment;
 filename*0="0001-Documentation-media-improve-V4L2_CID_MIN_BUFFERS_FOR.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzODk3YzllMzk5NzZjNGM0ZDRkMjdkOTkyOTE3OTY5YWVmMjExNjcwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlEOiA8Mzg5N2M5ZTM5OTc2YzRjNGQ0ZDI3ZDk5
MjkxNzk2OWFlZjIxMTY3MC4xNzMwMzkzNjY5LmdpdC5odmVya3VpbEB4czRhbGwubmw+CkZy
b206IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPgpEYXRlOiBXZWQsIDMwIE9j
dCAyMDI0IDExOjAzOjU4ICswMTAwClN1YmplY3Q6IFtQQVRDSCAxLzRdIERvY3VtZW50YXRp
b246IG1lZGlhOiBpbXByb3ZlIFY0TDJfQ0lEX01JTl9CVUZGRVJTX0ZPUl8qCiBkb2MKCkNs
ZWFybHkgc3RhdGUgdGhhdCB0aGUgVjRMMl9DSURfTUlOX0JVRkZFUlNfRk9SX09VVFBVVCBh
bmQKVjRMMl9DSURfTUlOX0JVRkZFUlNfRk9SX0NBUFRVUkUgY29udHJvbHMgYXJlIGZvciBz
dGF0ZWZ1bApjb2RlY3Mgb25seS4KClNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3VpbCA8aHZl
cmt1aWxAeHM0YWxsLm5sPgotLS0KIERvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRp
YS92NGwvY29udHJvbC5yc3QgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Vz
ZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2NvbnRyb2wucnN0IGIvRG9jdW1lbnRhdGlvbi91c2Vy
c3BhY2UtYXBpL21lZGlhL3Y0bC9jb250cm9sLnJzdAppbmRleCA1Nzg5MzgxNGExZTUuLjky
NTNjYzk0NmYwMiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21l
ZGlhL3Y0bC9jb250cm9sLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkv
bWVkaWEvdjRsL2NvbnRyb2wucnN0CkBAIC0yOTAsMTMgKzI5MCwxNSBAQCBDb250cm9sIElE
cwogICAgIFRoaXMgaXMgYSByZWFkLW9ubHkgY29udHJvbCB0aGF0IGNhbiBiZSByZWFkIGJ5
IHRoZSBhcHBsaWNhdGlvbiBhbmQKICAgICB1c2VkIGFzIGEgaGludCB0byBkZXRlcm1pbmUg
dGhlIG51bWJlciBvZiBDQVBUVVJFIGJ1ZmZlcnMgdG8gcGFzcyB0bwogICAgIFJFUUJVRlMu
IFRoZSB2YWx1ZSBpcyB0aGUgbWluaW11bSBudW1iZXIgb2YgQ0FQVFVSRSBidWZmZXJzIHRo
YXQgaXMKLSAgICBuZWNlc3NhcnkgZm9yIGhhcmR3YXJlIHRvIHdvcmsuCisgICAgbmVjZXNz
YXJ5IGZvciBoYXJkd2FyZSB0byB3b3JrLiBUaGlzIGNvbnRyb2wgaXMgcmVxdWlyZWQgZm9y
IHN0YXRlZnVsCisgICAgZGVjb2RlcnMuCiAKIGBgVjRMMl9DSURfTUlOX0JVRkZFUlNfRk9S
X09VVFBVVGBgIGBgKGludGVnZXIpYGAKICAgICBUaGlzIGlzIGEgcmVhZC1vbmx5IGNvbnRy
b2wgdGhhdCBjYW4gYmUgcmVhZCBieSB0aGUgYXBwbGljYXRpb24gYW5kCiAgICAgdXNlZCBh
cyBhIGhpbnQgdG8gZGV0ZXJtaW5lIHRoZSBudW1iZXIgb2YgT1VUUFVUIGJ1ZmZlcnMgdG8g
cGFzcyB0bwogICAgIFJFUUJVRlMuIFRoZSB2YWx1ZSBpcyB0aGUgbWluaW11bSBudW1iZXIg
b2YgT1VUUFVUIGJ1ZmZlcnMgdGhhdCBpcwotICAgIG5lY2Vzc2FyeSBmb3IgaGFyZHdhcmUg
dG8gd29yay4KKyAgICBuZWNlc3NhcnkgZm9yIGhhcmR3YXJlIHRvIHdvcmsuIFRoaXMgY29u
dHJvbCBpcyByZXF1aXJlZCBmb3Igc3RhdGVmdWwKKyAgICBlbmNvZGVycy4KIAogLi4gX3Y0
bDItYWxwaGEtY29tcG9uZW50OgogCi0tIAoyLjQ1LjIKCg==

--------------MBI0sIJwIEG4lkk0T7lel4K5--
