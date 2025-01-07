from django.http import HttpResponse
from django.http import JsonResponse


def index(request):
    return JsonResponse([{
        'name': 'potato, basic',
        'per': [1000, 'g'],
        'as_volume': [1.05, 'l'],
        'nutrients': {
            'calories': 740,
            'protein': 18,
            'carbohydrates': 175,
            'fat': 1,
            'fibre': 13,
        }
    }], safe=False)
