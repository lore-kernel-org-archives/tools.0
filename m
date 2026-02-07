Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C633C521
	for <tools@linux.kernel.org>; Sat,  7 Feb 2026 20:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770497528; cv=none; b=qJ40C8KdqUdLxwsFfjYr9ra/XPNRd6SKrAY0G6GLQ4WJ63669KrPO/Pzs/Yi/+EFek60xwDJ5KoBUMLcBwl8gVxR0lhws8hJOJ82KrlIcitLWtTaW3iPEcK+5rThEa0A4LlTYuPGu08LYMBP/y4JE/6NClIW2PwzOXOx5CZxIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770497528; c=relaxed/simple;
	bh=1x8eefMqJcENwM/sGIfk4vWSCMjgwI/ayrmuqr7pXzE=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=fyAudnD4+tpRAdZYZt7tEMBFwkdo/XtD7B3311jkJFylmNtdXJVF2Jb1G6MEaFQxIeLhZIcESun2yTmFGaybZQ+bqVYWm3rdGuDnhR28CuVQH3qOVBkgTJfdrFbV53mn7yyJ5HIlcy3JhvNFnp7Cv9mlJSvTVP0+oeFzvvBdEko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilNHpvxp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilNHpvxp"
Received: by smtp.kernel.org (Postfix)
	id 0BC9BC16AAE; Sat,  7 Feb 2026 20:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C48EC116D0;
	Sat,  7 Feb 2026 20:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770497527;
	bh=1x8eefMqJcENwM/sGIfk4vWSCMjgwI/ayrmuqr7pXzE=;
	h=Date:From:To:Subject:Cc:From;
	b=ilNHpvxpjVSp3wFVKq4rO2eAV1oRo1a6BPKutG+jG2Ku+a6xTCBQhM9nV9JPWnm8f
	 EmkyZmsgemLDd2Anp4rp2f5GVnXGnWepvnxfYSVox4AtaowKUg+R0rZj3vEjvMbuev
	 KPacXYuxbjjF9eJQnLJ7lvRUTlVHqUJC55qYKuK1Rm17Msqd69w51mOuJL6b4dvYL8
	 J+IyQFSmrU6usDw+dzEo8YyeNYpFq2mW2isx+wKwUl4kgPnCvoGChNiOAdXitXsFWW
	 DZfJkbzHbVfswVSxZtVmhvorTpnyEsPxAyljrmSXU2g+JKGdS3Hxq6usY1BB3G1Zw3
	 TWq7cuqb+hv8Q==
Message-ID: <695ccea6-bb19-4f6d-99cf-1d898b53b1cc@kernel.org>
Date: Sat, 7 Feb 2026 21:52:05 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
To: "Kernel.org Tools" <tools@kernel.org>
Subject: korgalore bug: Feed state not found for lch@ list
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
Cc: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey,

pipx korgalore on Ubuntu 25.10:
  package korgalore 0.5.1, installed using Python 3.13.7


I see JMAP korgalore errors on kgl pull:

  File
"/home/krzk/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/pi_feed.py",
line 227, in find_epochs
    raise PublicInboxError(f"No existing epochs found in {epochs_dir}.")
korgalore.PublicInboxError: No existing epochs found in
/home/krzk/.local/share/korgalore/lch/git.

Full trace:
https://pastebin.com/aUAz1jjf


Config file:
-------------------------
[targets.personal]
type = 'jmap'
server = 'https://api.fastmail.com'
username = 'me....'
token_file = '~/.config/korgalore/fastmail-token.txt'

### Deliveries ###

[deliveries.ksummit]
feed = 'https://lore.kernel.org/ksummit'
target = 'personal'
labels = ['LKML/ksummit']

[deliveries.lch]
feed = 'https://lore.kernel.org/lch'
target = 'personal'
labels = ['LKML/lch']

[deliveries.linux-samsung-soc]
feed = 'https://lore.kernel.org/linux-samsung-soc'
target = 'personal'
labels = ['LKML/linux-samsung-soc']

[deliveries.tools]
feed = 'https://lore.kernel.org/tools'
target = 'personal'
labels = ['LKML/tools']

[deliveries.workflows]
feed = 'https://lore.kernel.org/workflows'
target = 'personal'
labels = ['LKML/workflows']
-------------------------

If lch entry is commented out, everything works fine and it pulls 4
deliveries. It fails only if there is lch, which is different server:
https://subspace.kernel.org/lists.linux.dev.html

Best regards,
Krzysztof

